using System;

namespace codewar
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            string test = "HELLO";
            string test2 = "HELLOAPPLE";

            Console.WriteLine(HighestValue(test, test2));
            //Console.WriteLine(WordScore(test));

        }



        public static string HighestValue(string a, string b)
        {
            int a_value = WordScore(a);
            int b_value = WordScore(b);
            if (b_value > a_value)
            {
                return b;
            }
            else
            {
                return a;
            }
        }

        public static int WordScore(string word)
        {
            int score = 0;
            foreach (var c in word)
            {
                score += (int)c;
            }
            return score;
        }
    }
}