using System.Collections.Generic;

namespace DynamicNamesModGenerator.Service.Models
{
    public sealed class Language
    {
        public string Id { get; set; }

        public LanguageCode Code { get; set; }

        public IList<KeyValuePair<string, string>> GameIds { get; set; }
    }
}
