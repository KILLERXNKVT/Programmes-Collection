//javac -d . Area_peri_Package.java  // running command 
// sub for Area_peri_main

package areaperipack;

import java.lang.Math;

public class Area_peri_Package 
{
    interface shape 
    {
        float area(float x,float y);
        float peri(float x,float  y);
    }

    public class rectangle implements shape
    {
        public float area (float x,float y)
        {
            float sum=x*y;
            return sum;
        }
        public float peri (float x,float y)
        {
            float sum=2*(x+y);
            return sum;
        }
    }
    
    public class triangle implements shape
    {
        public float area (float x,float y)
        {
            float sum=0.5f*x*y;
            return sum;
        }
        public float peri (float x,float y)
        {
            float h=(float)Math.sqrt(x*x+y*y);
            float sum=x+y+h;
            return sum;
        }
    }

    public class circle implements shape
    {
        public float area(float x,float y)
        {
            float sum= x*x*y;
            return sum;
        }
        public float peri (float x,float y)
        {
            float sum=2*x*y;
            return sum;
        }    
    }    
}