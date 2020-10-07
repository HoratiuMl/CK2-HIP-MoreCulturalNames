#!/bin/bash

FILE="$1"
GAME="$2"

if [ ! -f "${FILE}" ]; then
    echo "The specified file does not exist!"
    exit
fi

sed -i 's/\t/    /g' "${FILE}"

if [ "${GAME}" == "CK3" ]; then
    sed -i '/[=\">]cn_/d' "${FILE}"
fi

sed -i 's/\r//g' "${FILE}"
sed -i '/^\s*[\{\}]*\s*$/d' "${FILE}"
sed -i 's/^\s*\([ekdcb]_[^\t =]*\)\s*=\s*/\1 =/g' "${FILE}"
perl -i -p0e 's/( *([ekdcb]_[^\t =]*) *= *\n)+ *([ekdcb]_[^\t =]*) *= */\3 =/g' "${FILE}"
sed -i 's/^ \+/      /g' "${FILE}"

function replace-cultural-name {
    CULTURE_ID="$1"
    LANGUAGE_ID="$2"

    echo "Replacing ${CULTURE_ID} with ${LANGUAGE_ID}"

    sed -i 's/^ *'"${CULTURE_ID}"' *= *\"\([^\"]*\)\"/      <Name language=\"'"${LANGUAGE_ID}"'\">\1<\/Name>/g' "${FILE}"
}

replace-cultural-name "afghan" "Pashto"
replace-cultural-name "alan" "Alan"
replace-cultural-name "armenian" "Armenian_Middle"
replace-cultural-name "ashkenazi" "Yiddish"
replace-cultural-name "assyrian" "Syriac_Classical"
replace-cultural-name "avar" "Avar_Old"
replace-cultural-name "baloch" "Balochi"
replace-cultural-name "basque" "Basque"
replace-cultural-name "bodpa" "Tibetan_Old"
replace-cultural-name "bolghar" "Bulgar"
replace-cultural-name "bosnian" "Bosnian_Medieval"
replace-cultural-name "breton" "Breton_Middle"
replace-cultural-name "bulgarian" "Bulgarian_Old"
replace-cultural-name "catalan" "Catalan_Medieval"
replace-cultural-name "coptic" "Egyptian_Coptic"
replace-cultural-name "croatian" "Croatian_Medieval"
replace-cultural-name "cuman" "Cuman"
replace-cultural-name "danish" "Danish_Middle"
replace-cultural-name "dutch" "Dutch_Middle"
replace-cultural-name "english" "English_Middle"
replace-cultural-name "ethiopian" "Amharic"
replace-cultural-name "finnish" "Finnish"
replace-cultural-name "frisian" "Frisian_Old"
replace-cultural-name "georgian" "Georgian"
replace-cultural-name "german" "German_Middle_High"
replace-cultural-name "greek" "Greek_Medieval"
replace-cultural-name "han" "Chinese_Middle"
replace-cultural-name "hungarian" "Hungarian_Old"
replace-cultural-name "irish" "Irish_Middle"
replace-cultural-name "karluk" "Karluk"
replace-cultural-name "khanty" "Khanty"
replace-cultural-name "khazar" "Khazar"
replace-cultural-name "khitan" "Khitan"
replace-cultural-name "kirghiz" "Kyrgyz"
replace-cultural-name "komi" "Komi"
replace-cultural-name "kurdish" "Kurdish"
replace-cultural-name "lettigallish" "Latgalian"
replace-cultural-name "lithuanian" "Lithuanian_Medieval"
replace-cultural-name "mongol" "Mongol_Proto"
replace-cultural-name "mordvin" "Moksha"
replace-cultural-name "norman" "Norman"
replace-cultural-name "norse" "Norse"
replace-cultural-name "norwegian" "Norwegian_Old"
replace-cultural-name "nubian" "Nubian_Old"
replace-cultural-name "occitan" "Occitan_Old"
replace-cultural-name "pecheneg" "Pecheneg"
replace-cultural-name "persian" "Persian"
replace-cultural-name "pictish" "Pictish"
replace-cultural-name "polish" "Polish_Old"
replace-cultural-name "pommeranian" "Pomeranian"
replace-cultural-name "portuguese" "Portuguese"
replace-cultural-name "prussian" "Prussian_Old"
replace-cultural-name "roman" "Latin_Medieval"
replace-cultural-name "russian" "Russian_Medieval"
replace-cultural-name "saka" "Khotanese"
replace-cultural-name "samoyed" "Samoyed"
replace-cultural-name "sardinian" "Sardinian"
replace-cultural-name "serbian" "Serbian_Medieval"
replace-cultural-name "sogdian" "Sogdian"
replace-cultural-name "swedish" "Swedish_Old"
replace-cultural-name "turkish" "Turkish_Old"
replace-cultural-name "uyghur" "Uyghur"
replace-cultural-name "welsh" "Welsh_Middle"
replace-cultural-name "zhangzhung" "Zhang-Zhung"

if [ "${GAME}" == "CK2" ]; then
    replace-cultural-name "old_frankish" "Frankish"
fi

if [ "${GAME}" == "CK2" ] || [ "${GAME}" == "CK2HIP" ]; then
    replace-cultural-name "andalusian_arabic" "Arabic_Andalusia"
    replace-cultural-name "arberian" "arberian"
    replace-cultural-name "bedouin_arabic" "Arabic_Bedouin"
    replace-cultural-name "bohemian" "Czech_Medieval"
    replace-cultural-name "carantanian" "Slovene_Medieval"
    replace-cultural-name "castillan" "Castillan_Medieval"
    replace-cultural-name "crimean_gothic" "Gothic_Crimean"
    replace-cultural-name "dalmatian" "Dalmatian_Medieval"
    replace-cultural-name "egyptian_arabic" "Egyptian_Arabic"
    replace-cultural-name "frankish" "French_Old"
    replace-cultural-name "lappish" "Sami"
    replace-cultural-name "levantine_arabic" "Arabic_Levant"
    replace-cultural-name "maghreb_arabic" "Arabic_Maghreb"
    replace-cultural-name "romanian" "Romanian_Old"
    replace-cultural-name "saxon" "English_Old"
    replace-cultural-name "scottish" "Scottish_Gaelic"
    replace-cultural-name "sephardi" "sephardi"
    replace-cultural-name "slovieni" "Slovak_Medieval"
    replace-cultural-name "ugricbaltic" "Estonian"
fi

if [ "${GAME}" == "CK2" ] || [ "${GAME}" == "CK3" ]; then
    replace-cultural-name "ilmenian" "Ilmenian"
    replace-cultural-name "italian" "Tuscan_Medieval"
    replace-cultural-name "meshchera" "Meshchera"
    replace-cultural-name "old_saxon" "German_Old_Low"
    replace-cultural-name "severian" "Severian"
    replace-cultural-name "suebi" "Suebi_Medieval"
    replace-cultural-name "tocharian" "Tocharian"
    replace-cultural-name "visigothic" "Gothic_Visigoth"
    replace-cultural-name "volhynian" "Volhynian"

    # Blacklisted
    sed -i '/^ *\(ilmenian\|outremer\|severian\|volhynian\) *=.*$/d' "${FILE}"
fi

if [ "${GAME}" == "CK2HIP" ]; then
    replace-cultural-name "langobardisch" "Langobardic"
    replace-cultural-name "low_saxon" "German_Old_Low"
    replace-cultural-name "tajik" "Tajiki"
    replace-cultural-name "vepsian" "Vepsian_Medieval"
    replace-cultural-name "yemeni" "Arabic_Yemen"
fi

if [ "${GAME}" == "CK2HIP" ] || [ "${GAME}" == "CK3" ]; then
    replace-cultural-name "aragonese" "Aragonese"
    replace-cultural-name "bashkir" "Bashkir"
    replace-cultural-name "bavarian" "Bavarian_Medieval"
    replace-cultural-name "cornish" "Cornish_Middle"
    replace-cultural-name "daylamite" "Daylami"
    replace-cultural-name "franconian" "Frankish"
    replace-cultural-name "galician" "Galician"
    replace-cultural-name "sicilian" "Sicilian"
    replace-cultural-name "swabian" "Alemannic_Medieval"
    replace-cultural-name "tajik" "Tajiki"
    replace-cultural-name "vepsian" "Vepsian_Medieval"
    replace-cultural-name "yemeni" "Arabic_Yemen"
    replace-cultural-name "zaghawa" "Zaghawa"
fi

if [ "${GAME}" == "CK3" ]; then
    replace-cultural-name "andalusian" "Arabic_Andalusia"
    replace-cultural-name "anglo_saxon" "English_Old"
    replace-cultural-name "asturleonese" "Leonese"
    replace-cultural-name "baranis" "Berber_Baranis"
    replace-cultural-name "bedouin" "Arabic_Bedouin"
    replace-cultural-name "butr" "Berber_Butr"
    replace-cultural-name "castilian" "Castillan_Medieval"
    replace-cultural-name "cisalpine" "Lombard_Medieval"
    replace-cultural-name "cumbrian" "Cumbric"
    replace-cultural-name "czech" "Czech_Medieval"
    replace-cultural-name "egyptian" "Egyptian_Arabic"
    replace-cultural-name "estonian" "Estonian"
    replace-cultural-name "french" "French_Old"
    replace-cultural-name "gaelic" "Scottish_Gaelic"
    replace-cultural-name "latgalian" "Latgalian"
    replace-cultural-name "levantine" "Arabic_Levant"
    replace-cultural-name "lombard" "Langobardic"
    replace-cultural-name "maghrebi" "Arabic_Maghreb"
    replace-cultural-name "merya" "Merya"
    replace-cultural-name "mogyer" "Hungarian_Old_Early"
    replace-cultural-name "muroma" "Muroma"
    replace-cultural-name "polabian" "Polabian"
    replace-cultural-name "sami" "Sami"
    replace-cultural-name "saxon" "German_Middle_Low"
    replace-cultural-name "scottish" "Scots_Early"
    replace-cultural-name "slovien" "Slovak_Medieval"
    replace-cultural-name "vlach" "Romanian_Old"
    replace-cultural-name "yughur" "Uyghur_Yellow"

    # Blacklisted for now
    sed -i '/^ *\(frankish\) *=.*$/d' "${FILE}"
fi
