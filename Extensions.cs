namespace Utube2M3u
{
    public static class Extensions
    {
        /// <summary>
        /// Extracts the substring starting from 'start' position to 'end' position.
        /// </summary>
        /// <param name="s">The given string.</param>
        /// <param name="start">The start position.</param>
        /// <param name="end">The end position.</param>
        /// <returns>The substring.</returns>
        public static string SubstringFromXToY(this string s, int start, int end)
        {
            return s.Substring(start, end - start);
        }
    }
}
