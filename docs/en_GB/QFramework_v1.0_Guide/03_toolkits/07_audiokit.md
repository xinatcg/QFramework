# 07. AudioKit Audio Management Solution

## Basic Usage

The following are the features related to audio playback in AudioKit:

*   Play background music. Only one music can be played at the same time. Playing other music will directly unload the currently playing music.
*   Play sound effects. Multiple sound effects can be played at the same time. It can also be used to play human voices when multiple people are speaking.
*   Play human voice. Same as playing background music, only one human voice can be played at the same time. It is suitable for playing some voiceovers.

The corresponding API call method is as follows:

```plain
btnPlayGame.onClick.AddListener(() => { AudioKit.PlayMusic("resources://game_bg"); });

btnPlaySound.onClick.AddListener(() => { AudioKit.PlaySound("resources://game_bg"); });

btnPlayVoiceA.onClick.AddListener(() => { AudioKit.PlayVoice("resources://game_bg"); });
```

The following are the functions related to AudioKit settings:

*   Background music switch
*   Sound effect switch
*   Human voice switch

The calling example is as follows:

```plain
btnSoundOn.onClick.AddListener(() => { AudioKit.Settings.IsSoundOn.Value = true; });

btnSoundOff.onClick.AddListener(() => { AudioKit.Settings.IsSoundOn.Value = false; });

btnMusicOn.onClick.AddListener(() => { AudioKit.Settings.IsMusicOn.Value = true; });

btnMusicOff.onClick.AddListener(() => { AudioKit.Settings.IsMusicOn.Value = false; });

btnVoiceOn.onClick.AddListener(() => { AudioKit.Settings.IsVoiceOn.Value = true; });

btnVoiceOff.onClick.AddListener(() => { AudioKit.Settings.IsVoiceOn.Value = false; });
```

This is the usage of the function to turn on the sound.

The code for adjusting the volume is as follows:

```plain
AudioKit.Settings.MusicVolume.RegisterWithInitValue(v => musicVolumeSlider.value = v);
AudioKit.Settings.VoiceVolume.RegisterWithInitValue(v => voiceVolumeSlider.value = v);
AudioKit.Settings.SoundVolume.RegisterWithInitValue(v => soundVolumeSlider.value = v);

musicVolumeSlider.onValueChanged.AddListener(v => { AudioKit.Settings.MusicVolume.Value = v; });
voiceVolumeSlider.onValueChanged.AddListener(v => { AudioKit.Settings.VoiceVolume.Value = v; });
soundVolumeSlider.onValueChanged.AddListener(v => { AudioKit.Settings.SoundVolume.Value = v; });
```

## How to Customize Audio Loading

Like UIKit, AudioKit also supports custom audio loading methods.

The reference code is as follows:

```plain
using System;
using UnityEngine;

namespace QFramework.Example
{
    public class CustomAudioLoaderExample : MonoBehaviour
    {
        /// <summary>
        /// 定义从 Resources 加载音频
        /// </summary>
        class ResourcesAudioLoaderPool : AbstractAudioLoaderPool
        {
            protected override IAudioLoader CreateLoader()
            {
                return new ResourcesAudioLoader();
            }
        }

        class ResourcesAudioLoader : IAudioLoader
        {
            private AudioClip mClip;

            public AudioClip Clip => mClip;

            public AudioClip LoadClip(AudioSearchKeys panelSearchKeys)
            {
                mClip = Resources.Load<AudioClip>(panelSearchKeys.AssetName);
                return mClip;
            }

            public void LoadClipAsync(AudioSearchKeys audioSearchKeys, Action<bool,AudioClip> onLoad)
            {
                var resourceRequest = Resources.LoadAsync<AudioClip>(audioSearchKeys.AssetName);
                resourceRequest.completed += operation =>
                {
                    var clip = resourceRequest.asset as AudioClip;
                    onLoad(clip, clip);
                };
            }

            public void Unload()
            {
                Resources.UnloadAsset(mClip);
            }
        }


        void Start()
        {
            // 启动时需要调用一次
            AudioKit.Config.AudioLoaderPool = new ResourcesAudioLoaderPool();
        }
    }
}
```

Since the AudioKit in QFramework is loaded through ResKit by default, please comment out the following code in the project when using a custom loading method:

```plain
    public class AudioKitWithResKitInit 
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        public static void Init()
        {
            AudioKit.Config.AudioLoaderPool = new ResKitAudioLoaderPool();
        }
    }
```

That's all about AudioKit.
