using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class Lista
    {

        public List<string> _list = new List<string>(); // Static List instance

        
        
        public  void Record(string value)
        {
             
                _list.Add(value);
         }

            public  void Display()
            {
               
                foreach (var value in _list)
                {
                    Console.WriteLine(value);
                }
            }
        public int tamano()
        {
           return  _list.Count;
        }
    }
}
