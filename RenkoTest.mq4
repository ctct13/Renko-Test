//+------------------------------------------------------------------+
//|                                                    RenkoTest.mq4 |
//|                                                             ctct |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "ctct"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

double brick_size = 14;
int direction;
datetime t0;
int brick_count = 0;
double base;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

   base = Open[0];

   t0 = Time[0];

   ObjectsDeleteAll();

   direction = 0;


//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

   if(ObjectFind("base") != -1)
     {
      ObjectDelete("base");
     }
   ObjectCreate("base",OBJ_HLINE,0,Time[0],base);
   ObjectSet("base",OBJPROP_STYLE,STYLE_DASHDOT);
   ObjectSet("base",OBJPROP_COLOR, clrGreen);

   if(direction == 0)
     {

      if(ObjectFind("base up") != -1)
        {
         ObjectDelete("base up");
        }
      ObjectCreate("base up",OBJ_HLINE,0,Time[0],base + brick_size*Point);
      ObjectSet("base up",OBJPROP_STYLE,STYLE_DASHDOT);
      ObjectSet("base up",OBJPROP_COLOR, clrDeepSkyBlue);

      if(ObjectFind("base down") != -1)
        {
         ObjectDelete("base down");
        }
      ObjectCreate("base down",OBJ_HLINE,0,Time[0],base - brick_size*Point);
      ObjectSet("base down",OBJPROP_STYLE,STYLE_DOT);
      ObjectSet("base down",OBJPROP_COLOR, clrRed);



      if(Bid >= base + brick_size*Point)
        {
         direction = 1;
         brick_count ++;
         string time_str = (string) Time[0];

         ObjectCreate(time_str, OBJ_RECTANGLE, 0, t0,base,Time[0],base + brick_size*Point);
         ObjectSet(time_str,OBJPROP_COLOR,clrDeepSkyBlue);

         base = base + brick_size*Point;
         t0 = Time[0];
        }

      if(Ask <= base - brick_size*Point)
        {

         direction = -1;
         brick_count ++;
         string time_str = (string) Time[0];

         ObjectCreate(time_str, OBJ_RECTANGLE, 0, t0, base - brick_size*Point,Time[0],base - brick_size*Point);
         ObjectSet(time_str,OBJPROP_COLOR,clrRed);

         base = base - brick_size*Point;
         t0 = Time[0];
        }
     }

   if(direction == 1)
     {

      if(ObjectFind("base up") != -1)
        {
         ObjectDelete("base up");
        }
      ObjectCreate("base up",OBJ_HLINE,0,Time[0],base + brick_size*Point);
      ObjectSet("base up",OBJPROP_STYLE,STYLE_DASHDOT);
      ObjectSet("base up",OBJPROP_COLOR, clrDeepSkyBlue);

      if(ObjectFind("base down") != -1)
        {
         ObjectDelete("base down");
        }
      ObjectCreate("base down",OBJ_HLINE,0,Time[0],base - 2*brick_size*Point);
      ObjectSet("base down",OBJPROP_STYLE,STYLE_DOT);
      ObjectSet("base down",OBJPROP_COLOR, clrRed);



      if(Bid >= base + brick_size*Point)
        {
         direction = 1;
         brick_count ++;
         string time_str = (string) Time[0];

         ObjectCreate(time_str, OBJ_RECTANGLE, 0, t0,base,Time[0],base + brick_size*Point);
         ObjectSet(time_str,OBJPROP_COLOR,clrDeepSkyBlue);

         base = base + brick_size*Point;
         t0 = Time[0];
        }

      if(Ask <= base - 2*brick_size*Point)
        {

         direction = -1;
         brick_count ++;
         string time_str = (string) Time[0];

         ObjectCreate(time_str, OBJ_RECTANGLE, 0, t0, base - brick_size*Point,Time[0],base - 2*brick_size*Point);
         ObjectSet(time_str,OBJPROP_COLOR,clrRed);

         base = base - 2*brick_size*Point;
         t0 = Time[0];
        }
     }

   if(direction == -1)
     {

      if(ObjectFind("base up") != -1)
        {
         ObjectDelete("base up");
        }
      ObjectCreate("base up",OBJ_HLINE,0,Time[0],base + 2*brick_size*Point);
      ObjectSet("base up",OBJPROP_STYLE,STYLE_DASHDOT);
      ObjectSet("base up",OBJPROP_COLOR, clrDeepSkyBlue);

      if(ObjectFind("base down") != -1)
        {
         ObjectDelete("base down");
        }
      ObjectCreate("base down",OBJ_HLINE,0,Time[0],base - brick_size*Point);
      ObjectSet("base down",OBJPROP_STYLE,STYLE_DOT);
      ObjectSet("base down",OBJPROP_COLOR, clrRed);

      if(Ask <= base - brick_size*Point)
        {
         direction = -1;
         brick_count ++;
         string time_str = (string) Time[0];

         ObjectCreate(time_str, OBJ_RECTANGLE, 0, t0,base,Time[0],base - brick_size*Point);
         ObjectSet(time_str,OBJPROP_COLOR,clrRed);

         base = base - brick_size*Point;
         t0 = Time[0];
        }

      if(Bid >= base + 2*brick_size*Point)

        {
         direction = 1;
         brick_count ++;
         string time_str = (string) Time[0];

         ObjectCreate(time_str, OBJ_RECTANGLE,0,t0,base + brick_size*Point,Time[0],base + 2*brick_size*Point);
         ObjectSet(time_str,OBJPROP_COLOR,clrDeepSkyBlue);


         base = base + 2*brick_size*Point;
         t0 = Time[0];
        }
     }

   Comment("Direction: ",direction,"   Base: ",base);




  }
//+------------------------------------------------------------------+
