namespace ZiplineTour.Framework
{
    public static class ControllerConfig
    {
        public static class InputType
        {
            public const string ApplicationJson = "application/json";
            public const string Text = "Text";
        }

        public static class Property
        {
            public const string APIController = "api/[controller]/[action]";
            public const string AllowOrigin = "AllowSpecificOrigins";
        }
    }
}