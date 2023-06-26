#!/usr/bin/env sh

cd ../translator || exit

npx ts-node-esm index.ts 01_introduction/01_introduction.md
npx ts-node-esm index.ts 01_introduction/02_roadmap.md

npx ts-node-esm index.ts 02_architecture/01_qf_architecture.md
npx ts-node-esm index.ts 02_architecture/02_qf_mvc.md
npx ts-node-esm index.ts 02_architecture/03_use_command.md
npx ts-node-esm index.ts 02_architecture/04_use_event.md
npx ts-node-esm index.ts 02_architecture/05_use_utility.md
npx ts-node-esm index.ts 02_architecture/06_use_system.md
npx ts-node-esm index.ts 02_architecture/08_dependency_inversion_principle.md
npx ts-node-esm index.ts 02_architecture/09_use_query.md
npx ts-node-esm index.ts 02_architecture/10_architecture_spec_and_recommended_usage.md
npx ts-node-esm index.ts 02_architecture/11_editor_counterapp.md
npx ts-node-esm index.ts 02_architecture/12_design_on_paper.md
npx ts-node-esm index.ts 02_architecture/13_architecture_pros.md
npx ts-node-esm index.ts 02_architecture/14_command_hook.md
npx ts-node-esm index.ts 02_architecture/15_typeeventsystem.md
npx ts-node-esm index.ts 02_architecture/16_easyevent.md
npx ts-node-esm index.ts 02_architecture/17_bindableproperty.md
#npx ts-node-esm index.ts 02_architecture/18_ioccontainer.md
npx ts-node-esm index.ts 02_architecture/19_architecture_in_mind.md
npx ts-node-esm index.ts 02_architecture/20_more_content.md

npx ts-node-esm index.ts 03_toolkits/01_intro_qframework_toolkits.md
npx ts-node-esm index.ts 03_toolkits/02_download_and_install.md
npx ts-node-esm index.ts 03_toolkits/03_codegenkit.md
npx ts-node-esm index.ts 03_toolkits/04_actionkit.md
npx ts-node-esm index.ts 03_toolkits/05_reskit.md
npx ts-node-esm index.ts 03_toolkits/06_uikit.md
npx ts-node-esm index.ts 03_toolkits/07_audiokit.md
npx ts-node-esm index.ts 03_toolkits/08_fluentapi.md
npx ts-node-esm index.ts 03_toolkits/09_singletonkit.md
npx ts-node-esm index.ts 03_toolkits/10_fsmkit.md
npx ts-node-esm index.ts 03_toolkits/11_poolkit.md
npx ts-node-esm index.ts 03_toolkits/12_tablekit.md
npx ts-node-esm index.ts 03_toolkits/13_other_event_toolkits.md
npx ts-node-esm index.ts 03_toolkits/14_more.md
npx ts-node-esm index.ts 03_toolkits/15_gridkit.md
npx ts-node-esm index.ts 03_toolkits/16_livecodingkit.md