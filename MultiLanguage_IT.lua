local addonName = ...
local optionsFrame = CreateFrame("Frame")

local function languageExists(value)
    for _, language in ipairs(MultiLanguageOptions.AVAILABLE_LANGUAGES) do
        if language.value == value then
            return true
        end
    end
    return false
end

local function addLanguageOption()
    if not languageExists('it') then
        table.insert(MultiLanguageOptions.AVAILABLE_LANGUAGES, {value = 'it', text = 'Italian'})
        AddLanguageDropdownOption()
    end

    if MultiLanguageTranslations['it'] == nil then
        MultiLanguageTranslations['it'] = {
            description = 'Descrizione',
            objectives = 'Obiettivi della missione'
        }
    end
end

local function addonLoaded(self, event, addonLoadedName)
    if addonLoadedName == addonName then
        addLanguageOption()
    end
end

optionsFrame:RegisterEvent("ADDON_LOADED")
optionsFrame:SetScript("OnEvent", addonLoaded)
