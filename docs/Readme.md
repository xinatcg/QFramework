# Document

## How to Translate to English

1. Ensure that the Chinese version of the document is already placed in the corresponding `en_GB` folder. The translator will generate a translated file to override it.

2. Copy the `.env.tpl` file from the `en_translate` folder to the `translator` folder.

3. Copy the `prompt.md` file from the `en_translate` folder to the `translator` folder.

4. Fill in the OpenAI API key in the `.env` file.

5. Once the above steps are completed, the translator is ready to use.

6. Create a run script based on `0_translate.sh` and execute it to initiate the translation process.

## Translation Method

The translation process is based on the [markdown-gpt-translator](https://github.com/smikitky/markdown-gpt-translator) tool, which utilizes the OpenAI API for translation.

Please note that although the tool itself is free, you will need to pay for API usage by providing your API Key.

For the convenience of this project, we have directly copied version 0.3.0 of the tool to the repository. This version does not support npm installation. However, we may consider upgrading it in the future when it becomes accessible through NPM directly.

## How to Translate to a Different Language

To facilitate translations into different languages, follow these steps:

1. Copy the `en_translate` folder and rename it as `pt_translate` for translating to Portuguese.

2. In the `.env.tpl` file, modify the base folder path to the corresponding language folder, such as `../pt/QFramework_v1.0_Guide` for Portuguese translations.

3. Open the `prompt.md` file and replace the word "English" with the target language, such as "Portuguese."

4. If necessary, update the rules in the `prompt.md` file to align with the specific language requirements for translation.