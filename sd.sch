VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL an0
        SIGNAL an1
        SIGNAL an2
        SIGNAL an3
        SIGNAL seg0
        SIGNAL seg1
        SIGNAL seg2
        SIGNAL seg3
        SIGNAL seg4
        SIGNAL seg5
        SIGNAL seg6
        SIGNAL dp
        SIGNAL led1
        SIGNAL led2
        SIGNAL led3
        SIGNAL led4
        SIGNAL led5
        SIGNAL led6
        SIGNAL led7
        SIGNAL led0
        SIGNAL btn3
        SIGNAL btn2
        SIGNAL btn1
        SIGNAL pressure0
        SIGNAL pressure1
        SIGNAL pressure2
        SIGNAL pressure3
        SIGNAL clk1
        SIGNAL sw1
        SIGNAL sw2
        SIGNAL sw3
        SIGNAL sw4
        SIGNAL sw5
        SIGNAL sw6
        SIGNAL sw7
        SIGNAL sw0
        SIGNAL standard_clock
        SIGNAL slow_clock
        SIGNAL display_clock
        SIGNAL Switch0
        SIGNAL Switch1
        SIGNAL Sel(1)
        SIGNAL Sel(0)
        SIGNAL Switch4
        SIGNAL Switch5
        SIGNAL Switch6
        SIGNAL Switch7
        SIGNAL LEDS(7)
        SIGNAL LEDS(6)
        SIGNAL LEDS(5)
        SIGNAL LEDS(4)
        SIGNAL LEDS(3)
        SIGNAL LEDS(2)
        SIGNAL LEDS(1)
        SIGNAL LEDS(0)
        SIGNAL XLXN_284
        SIGNAL XLXN_285
        SIGNAL XLXN_286
        SIGNAL XLXN_287
        SIGNAL XLXN_288
        SIGNAL XLXN_289
        SIGNAL Display(11)
        SIGNAL Display(10)
        SIGNAL Display(9)
        SIGNAL Display(8)
        SIGNAL XLXN_294
        SIGNAL Display(7)
        SIGNAL Display(6)
        SIGNAL XLXN_298
        SIGNAL Display(4)
        SIGNAL XLXN_300
        SIGNAL Display(3)
        SIGNAL Display(2)
        SIGNAL Display(1)
        SIGNAL Display(0)
        SIGNAL XLXN_305
        SIGNAL btn0
        SIGNAL LEDS(7:0)
        SIGNAL Velocidade(7:0)
        SIGNAL Display(11:0)
        SIGNAL Aquecer
        SIGNAL XLXN_312
        SIGNAL Sel(1:0)
        PORT Output an0
        PORT Output an1
        PORT Output an2
        PORT Output an3
        PORT Output seg0
        PORT Output seg1
        PORT Output seg2
        PORT Output seg3
        PORT Output seg4
        PORT Output seg5
        PORT Output seg6
        PORT Output dp
        PORT Output led1
        PORT Output led2
        PORT Output led3
        PORT Output led4
        PORT Output led5
        PORT Output led6
        PORT Output led7
        PORT Output led0
        PORT Input btn3
        PORT Input btn2
        PORT Input btn1
        PORT Input clk1
        PORT Input sw1
        PORT Input sw2
        PORT Input sw3
        PORT Input sw4
        PORT Input sw5
        PORT Input sw6
        PORT Input sw7
        PORT Input sw0
        PORT Input btn0
        BEGIN BLOCKDEF clkdiv
            TIMESTAMP 2009 11 12 15 8 48
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2001 2 2 12 51 12
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCKDEF disp7
            TIMESTAMP 2012 10 31 12 17 2
            LINE N 64 -288 0 -288 
            RECTANGLE N 64 -1088 480 -80 
            LINE N 64 -928 0 -928 
            LINE N 64 -960 0 -960 
            LINE N 64 -896 0 -896 
            LINE N 64 -864 0 -864 
            LINE N 64 -1008 0 -1008 
            BEGIN LINE N 192 -848 192 -1020 
                LINECOLOR 0 0 128
            END LINE
            LINE N 64 -736 0 -736 
            LINE N 64 -704 0 -704 
            LINE N 64 -672 0 -672 
            LINE N 64 -640 0 -640 
            LINE N 64 -784 0 -784 
            BEGIN LINE N 192 -796 192 -624 
                LINECOLOR 0 0 128
            END LINE
            LINE N 64 -512 0 -512 
            LINE N 64 -480 0 -480 
            LINE N 64 -448 0 -448 
            LINE N 64 -416 0 -416 
            LINE N 64 -560 0 -560 
            BEGIN LINE N 192 -572 192 -400 
                LINECOLOR 0 0 128
            END LINE
            LINE N 64 -256 0 -256 
            LINE N 64 -224 0 -224 
            LINE N 64 -192 0 -192 
            LINE N 64 -336 0 -336 
            BEGIN LINE N 192 -348 192 -176 
                LINECOLOR 0 0 128
            END LINE
            LINE N 64 -128 0 -128 
            LINE N 480 -1056 544 -1056 
            LINE N 480 -736 544 -736 
            LINE N 480 -1008 544 -1008 
            LINE N 480 -960 544 -960 
            LINE N 480 -912 544 -912 
            LINE N 480 -688 544 -688 
            LINE N 480 -640 544 -640 
            LINE N 480 -592 544 -592 
            LINE N 480 -544 544 -544 
            LINE N 480 -496 544 -496 
            LINE N 480 -448 544 -448 
            LINE N 480 -304 544 -304 
        END BLOCKDEF
        BEGIN BLOCKDEF debouncer
            TIMESTAMP 2012 11 30 17 17 13
            RECTANGLE N 64 -384 384 -36 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 384 -160 448 -160 
            LINE N 384 -224 448 -224 
            LINE N 384 -288 448 -288 
            LINE N 384 -352 448 -352 
            LINE N 160 -36 160 16 
            LINE N 304 -36 304 16 
        END BLOCKDEF
        BEGIN BLOCKDEF Bimby
            TIMESTAMP 2014 12 15 17 25 24
            RECTANGLE N 64 -512 400 0 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            LINE N 400 -480 464 -480 
            RECTANGLE N 400 -348 464 -324 
            LINE N 400 -336 464 -336 
            RECTANGLE N 400 -204 464 -180 
            LINE N 400 -192 464 -192 
            RECTANGLE N 400 -60 464 -36 
            LINE N 400 -48 464 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_34 disp7
            PIN disp4_0 XLXN_288
            PIN disp1_1 Display(1)
            PIN disp1_0 Display(0)
            PIN disp1_2 Display(2)
            PIN disp1_3 Display(3)
            PIN aceso1 XLXN_305
            PIN disp2_0 Display(4)
            PIN disp2_1 XLXN_298
            PIN disp2_2 Display(6)
            PIN disp2_3 Display(7)
            PIN aceso2 XLXN_305
            PIN disp3_0 Display(8)
            PIN disp3_1 Display(9)
            PIN disp3_2 Display(10)
            PIN disp3_3 Display(11)
            PIN aceso3 XLXN_305
            PIN disp4_1 XLXN_287
            PIN disp4_2 XLXN_286
            PIN disp4_3 XLXN_285
            PIN aceso4 XLXN_305
            PIN clk standard_clock
            PIN en1 an0
            PIN segm1 seg0
            PIN en2 an1
            PIN en3 an2
            PIN en4 an3
            PIN segm2 seg1
            PIN segm3 seg2
            PIN segm4 seg3
            PIN segm5 seg4
            PIN segm6 seg5
            PIN segm7 seg6
            PIN dp dp
        END BLOCK
        BEGIN BLOCK XLXI_2 buf
            PIN I LEDS(1)
            PIN O led1
        END BLOCK
        BEGIN BLOCK XLXI_3 buf
            PIN I LEDS(2)
            PIN O led2
        END BLOCK
        BEGIN BLOCK XLXI_4 buf
            PIN I LEDS(3)
            PIN O led3
        END BLOCK
        BEGIN BLOCK XLXI_5 buf
            PIN I LEDS(4)
            PIN O led4
        END BLOCK
        BEGIN BLOCK XLXI_6 buf
            PIN I LEDS(5)
            PIN O led5
        END BLOCK
        BEGIN BLOCK XLXI_7 buf
            PIN I LEDS(6)
            PIN O led6
        END BLOCK
        BEGIN BLOCK XLXI_8 buf
            PIN I LEDS(7)
            PIN O led7
        END BLOCK
        BEGIN BLOCK XLXI_9 buf
            PIN I LEDS(0)
            PIN O led0
        END BLOCK
        BEGIN BLOCK XLXI_35 debouncer
            PIN btn0 btn0
            PIN btn1 btn1
            PIN btn2 btn2
            PIN btn3 btn3
            PIN pressure3 pressure3
            PIN pressure2 pressure2
            PIN pressure1 pressure1
            PIN pressure0 pressure0
            PIN standard_clk standard_clock
            PIN reset Switch7
        END BLOCK
        BEGIN BLOCK XLXI_1 clkdiv
            PIN clk clk1
            PIN clk_fast standard_clock
            PIN clk_slow slow_clock
            PIN clk_disp display_clock
        END BLOCK
        BEGIN BLOCK XLXI_20 buf
            PIN I sw1
            PIN O Switch1
        END BLOCK
        BEGIN BLOCK XLXI_21 buf
            PIN I sw2
            PIN O Sel(1)
        END BLOCK
        BEGIN BLOCK XLXI_22 buf
            PIN I sw3
            PIN O Sel(0)
        END BLOCK
        BEGIN BLOCK XLXI_23 buf
            PIN I sw4
            PIN O Switch4
        END BLOCK
        BEGIN BLOCK XLXI_24 buf
            PIN I sw5
            PIN O Switch5
        END BLOCK
        BEGIN BLOCK XLXI_25 buf
            PIN I sw6
            PIN O Switch6
        END BLOCK
        BEGIN BLOCK XLXI_26 buf
            PIN I sw7
            PIN O Switch7
        END BLOCK
        BEGIN BLOCK XLXI_27 buf
            PIN I sw0
            PIN O Switch0
        END BLOCK
        BEGIN BLOCK XLXI_36 Bimby
            PIN Reset Switch1
            PIN Up pressure1
            PIN Down pressure2
            PIN Cancel pressure3
            PIN Start pressure0
            PIN ManualMode Switch0
            PIN CLK standard_clock
            PIN Sel(1:0) Sel(1:0)
            PIN Aquecer Aquecer
            PIN Display(11:0) Display(11:0)
            PIN Velocidade(7:0) Velocidade(7:0)
            PIN Leds(7:0) LEDS(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_37 vcc
            PIN P XLXN_305
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        BEGIN INSTANCE XLXI_34 6000 1824 R0
        END INSTANCE
        BEGIN BRANCH an0
            WIRE 6544 768 6656 768
        END BRANCH
        BEGIN BRANCH an1
            WIRE 6544 816 6656 816
        END BRANCH
        BEGIN BRANCH an2
            WIRE 6544 864 6656 864
        END BRANCH
        BEGIN BRANCH an3
            WIRE 6544 912 6656 912
        END BRANCH
        BEGIN BRANCH seg0
            WIRE 6544 1088 6656 1088
        END BRANCH
        BEGIN BRANCH seg1
            WIRE 6544 1136 6656 1136
        END BRANCH
        BEGIN BRANCH seg2
            WIRE 6544 1184 6656 1184
        END BRANCH
        BEGIN BRANCH seg3
            WIRE 6544 1232 6656 1232
        END BRANCH
        BEGIN BRANCH seg4
            WIRE 6544 1280 6656 1280
        END BRANCH
        BEGIN BRANCH seg5
            WIRE 6544 1328 6656 1328
        END BRANCH
        BEGIN BRANCH seg6
            WIRE 6544 1376 6656 1376
        END BRANCH
        BEGIN BRANCH dp
            WIRE 6544 1520 6656 1520
        END BRANCH
        BEGIN BRANCH led1
            WIRE 6464 2208 6656 2208
        END BRANCH
        BEGIN BRANCH led2
            WIRE 6464 2288 6656 2288
        END BRANCH
        BEGIN BRANCH led3
            WIRE 6464 2368 6656 2368
        END BRANCH
        BEGIN BRANCH led4
            WIRE 6464 2448 6656 2448
        END BRANCH
        BEGIN BRANCH led5
            WIRE 6464 2528 6656 2528
        END BRANCH
        BEGIN BRANCH led6
            WIRE 6464 2608 6656 2608
        END BRANCH
        BEGIN BRANCH led7
            WIRE 6464 2688 6656 2688
        END BRANCH
        BEGIN BRANCH led0
            WIRE 6464 2128 6656 2128
        END BRANCH
        INSTANCE XLXI_2 6240 2240 R0
        INSTANCE XLXI_3 6240 2320 R0
        INSTANCE XLXI_4 6240 2400 R0
        INSTANCE XLXI_5 6240 2480 R0
        INSTANCE XLXI_6 6240 2560 R0
        INSTANCE XLXI_7 6240 2640 R0
        INSTANCE XLXI_8 6240 2720 R0
        INSTANCE XLXI_9 6240 2160 R0
        BEGIN DISPLAY 5972 612 TEXT "Display 7 segmentos"
            FONT 64 "Arial"
        END DISPLAY
        BEGIN DISPLAY 6256 2028 TEXT Leds
            FONT 64 "Arial"
        END DISPLAY
        BEGIN RECTANGLE W 5876 352 6880 2800 
            LINECOLOR 128 0 0
            LINESTYLE Dash
        END RECTANGLE
        IOMARKER 6656 768 an0 R0 28
        IOMARKER 6656 816 an1 R0 28
        IOMARKER 6656 864 an2 R0 28
        IOMARKER 6656 912 an3 R0 28
        IOMARKER 6656 1088 seg0 R0 28
        IOMARKER 6656 1136 seg1 R0 28
        IOMARKER 6656 1184 seg2 R0 28
        IOMARKER 6656 1232 seg3 R0 28
        IOMARKER 6656 1280 seg4 R0 28
        IOMARKER 6656 1328 seg5 R0 28
        IOMARKER 6656 1376 seg6 R0 28
        IOMARKER 6656 1520 dp R0 28
        IOMARKER 6656 2208 led1 R0 28
        IOMARKER 6656 2288 led2 R0 28
        IOMARKER 6656 2368 led3 R0 28
        IOMARKER 6656 2448 led4 R0 28
        IOMARKER 6656 2528 led5 R0 28
        IOMARKER 6656 2608 led6 R0 28
        IOMARKER 6656 2688 led7 R0 28
        IOMARKER 6656 2128 led0 R0 28
        BEGIN DISPLAY 6148 436 TEXT "NAO ALTERAR"
            FONT 60 "Arial"
            TEXTCOLOR 128 0 0
        END DISPLAY
        BEGIN DISPLAY 6652 292 TEXT SAIDAS
            FONT 60 "Arial"
            TEXTCOLOR 128 0 0
        END DISPLAY
        BEGIN RECTANGLE W 104 412 1092 2792 
            LINECOLOR 128 0 0
            LINESTYLE Dash
        END RECTANGLE
        BEGIN DISPLAY 372 500 TEXT "NAO ALTERAR"
            FONT 60 "Arial"
            TEXTCOLOR 128 0 0
        END DISPLAY
        BEGIN DISPLAY 104 348 TEXT ENTRADAS
            FONT 60 "Arial"
            TEXTCOLOR 128 0 0
        END DISPLAY
        BEGIN DISPLAY 304 620 TEXT "Botoes de pressao"
            FONT 64 "Arial"
        END DISPLAY
        BEGIN INSTANCE XLXI_35 336 1152 R0
        END INSTANCE
        BEGIN BRANCH pressure1
            WIRE 784 864 800 864
            WIRE 800 864 1200 864
            WIRE 1200 864 2272 864
            WIRE 2272 864 2272 1408
            WIRE 2272 1408 3360 1408
            BEGIN DISPLAY 800 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH pressure2
            WIRE 784 928 800 928
            WIRE 800 928 1200 928
            WIRE 1200 928 2224 928
            WIRE 2224 928 2224 1472
            WIRE 2224 1472 3360 1472
            BEGIN DISPLAY 800 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH pressure3
            WIRE 784 992 800 992
            WIRE 800 992 1200 992
            WIRE 1200 992 2288 992
            WIRE 2288 992 2288 1536
            WIRE 2288 1536 3360 1536
            BEGIN DISPLAY 800 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_1 336 1664 R0
        END INSTANCE
        BEGIN BRANCH clk1
            WIRE 320 1504 336 1504
        END BRANCH
        BEGIN BRANCH sw1
            WIRE 304 2192 464 2192
        END BRANCH
        BEGIN BRANCH sw2
            WIRE 304 2272 464 2272
        END BRANCH
        BEGIN BRANCH sw3
            WIRE 304 2352 464 2352
        END BRANCH
        BEGIN BRANCH sw4
            WIRE 304 2432 464 2432
        END BRANCH
        BEGIN BRANCH sw5
            WIRE 304 2512 464 2512
        END BRANCH
        BEGIN BRANCH sw6
            WIRE 304 2592 464 2592
        END BRANCH
        BEGIN BRANCH sw7
            WIRE 304 2672 464 2672
        END BRANCH
        INSTANCE XLXI_20 464 2224 R0
        INSTANCE XLXI_21 464 2304 R0
        INSTANCE XLXI_22 464 2384 R0
        INSTANCE XLXI_23 464 2464 R0
        INSTANCE XLXI_24 464 2544 R0
        INSTANCE XLXI_25 464 2624 R0
        INSTANCE XLXI_26 464 2704 R0
        BEGIN BRANCH sw0
            WIRE 304 2112 464 2112
        END BRANCH
        INSTANCE XLXI_27 464 2144 R0
        BEGIN DISPLAY 256 2024 TEXT "Botoes on/off"
            FONT 64 "Arial"
        END DISPLAY
        BEGIN BRANCH standard_clock
            WIRE 720 1504 816 1504
            WIRE 816 1504 1200 1504
            WIRE 1200 1504 2272 1504
            WIRE 2272 1504 2272 1728
            WIRE 2272 1728 3360 1728
            WIRE 1200 1248 1200 1504
            WIRE 1200 1248 3840 1248
            WIRE 3840 1248 3840 1696
            WIRE 3840 1696 5824 1696
            WIRE 5824 1696 6000 1696
            BEGIN DISPLAY 816 1504 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH slow_clock
            WIRE 720 1568 784 1568
            WIRE 784 1568 1200 1568
            BEGIN DISPLAY 784 1568 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH display_clock
            WIRE 720 1632 800 1632
            WIRE 800 1632 1200 1632
            BEGIN DISPLAY 800 1632 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Switch0
            WIRE 688 2112 720 2112
            WIRE 720 2112 1200 2112
            WIRE 1200 1664 3360 1664
            WIRE 1200 1664 1200 2112
            BEGIN DISPLAY 720 2112 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Switch1
            WIRE 688 2192 720 2192
            WIRE 720 2192 1200 2192
            WIRE 1200 2192 2256 2192
            WIRE 2256 1344 2256 2192
            WIRE 2256 1344 3360 1344
            BEGIN DISPLAY 720 2192 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Sel(1)
            WIRE 688 2272 720 2272
            WIRE 720 2272 1200 2272
            WIRE 1200 2272 1328 2272
            BEGIN DISPLAY 720 2272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Sel(0)
            WIRE 688 2352 720 2352
            WIRE 720 2352 1200 2352
            WIRE 1200 2352 1328 2352
            BEGIN DISPLAY 720 2352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Switch4
            WIRE 688 2432 720 2432
            WIRE 720 2432 1200 2432
            BEGIN DISPLAY 720 2432 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Switch5
            WIRE 688 2512 720 2512
            WIRE 720 2512 1200 2512
            BEGIN DISPLAY 720 2512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Switch6
            WIRE 688 2592 720 2592
            WIRE 720 2592 1200 2592
            BEGIN DISPLAY 720 2592 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Switch7
            WIRE 688 2672 720 2672
            WIRE 720 2672 1200 2672
            BEGIN DISPLAY 720 2672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 304 2192 sw1 R180 28
        IOMARKER 304 2272 sw2 R180 28
        IOMARKER 304 2352 sw3 R180 28
        IOMARKER 304 2432 sw4 R180 28
        IOMARKER 304 2512 sw5 R180 28
        IOMARKER 304 2592 sw6 R180 28
        IOMARKER 304 2672 sw7 R180 28
        IOMARKER 304 2112 sw0 R180 28
        IOMARKER 320 1504 clk1 R180 28
        BEGIN BRANCH standard_clock
            WIRE 496 1168 496 1264
            WIRE 496 1264 784 1264
            BEGIN DISPLAY 784 1264 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Switch7
            WIRE 640 1168 640 1200
            WIRE 640 1200 784 1200
            BEGIN DISPLAY 784 1200 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH pressure0
            WIRE 784 800 800 800
            WIRE 800 800 1200 800
            WIRE 1200 800 2240 800
            WIRE 2240 800 2240 1600
            WIRE 2240 1600 3360 1600
            BEGIN DISPLAY 800 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LEDS(7)
            WIRE 5824 2688 6240 2688
        END BRANCH
        BEGIN BRANCH LEDS(6)
            WIRE 5824 2608 6240 2608
        END BRANCH
        BEGIN BRANCH LEDS(5)
            WIRE 5824 2528 6240 2528
        END BRANCH
        BEGIN BRANCH LEDS(4)
            WIRE 5824 2448 6240 2448
        END BRANCH
        BEGIN BRANCH LEDS(3)
            WIRE 5824 2368 6240 2368
        END BRANCH
        BEGIN BRANCH LEDS(2)
            WIRE 5824 2288 6240 2288
        END BRANCH
        BEGIN BRANCH LEDS(0)
            WIRE 5824 2128 6240 2128
        END BRANCH
        BEGIN BRANCH XLXN_285
            WIRE 5824 1632 6000 1632
        END BRANCH
        BEGIN BRANCH XLXN_286
            WIRE 5824 1600 6000 1600
        END BRANCH
        BEGIN BRANCH XLXN_287
            WIRE 5824 1568 6000 1568
        END BRANCH
        BEGIN BRANCH XLXN_288
            WIRE 5824 1536 6000 1536
        END BRANCH
        BEGIN BRANCH Display(11)
            WIRE 5824 1408 6000 1408
        END BRANCH
        BEGIN BRANCH Display(10)
            WIRE 5824 1376 6000 1376
        END BRANCH
        BEGIN BRANCH Display(9)
            WIRE 5824 1344 6000 1344
        END BRANCH
        BEGIN BRANCH Display(8)
            WIRE 5824 1312 6000 1312
        END BRANCH
        BEGIN BRANCH Display(7)
            WIRE 5824 1184 6000 1184
        END BRANCH
        BEGIN BRANCH Display(6)
            WIRE 5824 1152 6000 1152
        END BRANCH
        BEGIN BRANCH XLXN_298
            WIRE 5824 1120 6000 1120
        END BRANCH
        BEGIN BRANCH Display(4)
            WIRE 5824 1088 6000 1088
        END BRANCH
        BEGIN BRANCH Display(3)
            WIRE 5824 960 6000 960
        END BRANCH
        BEGIN BRANCH Display(2)
            WIRE 5824 928 6000 928
        END BRANCH
        BEGIN BRANCH Display(1)
            WIRE 5824 896 6000 896
        END BRANCH
        BEGIN BRANCH Display(0)
            WIRE 5824 864 6000 864
        END BRANCH
        BEGIN BRANCH XLXN_305
            WIRE 5360 800 5360 816
            WIRE 5360 816 5472 816
            WIRE 5472 816 5824 816
            WIRE 5824 816 6000 816
            WIRE 5360 816 5360 1040
            WIRE 5360 1040 5824 1040
            WIRE 5824 1040 6000 1040
            WIRE 5360 1040 5360 1264
            WIRE 5360 1264 5824 1264
            WIRE 5824 1264 6000 1264
            WIRE 5360 1264 5360 1488
            WIRE 5360 1488 5824 1488
            WIRE 5824 1488 6000 1488
        END BRANCH
        BEGIN BRANCH btn3
            WIRE 288 992 336 992
        END BRANCH
        BEGIN BRANCH btn2
            WIRE 288 928 336 928
        END BRANCH
        BEGIN BRANCH btn1
            WIRE 288 864 336 864
        END BRANCH
        IOMARKER 288 800 btn0 R180 28
        IOMARKER 288 864 btn1 R180 28
        IOMARKER 288 928 btn2 R180 28
        IOMARKER 288 992 btn3 R180 28
        BEGIN DISPLAY 924 1484 TEXT (55MHz)
            FONT 24 "Arial"
        END DISPLAY
        BEGIN DISPLAY 924 1548 TEXT (0,8Hz)
            FONT 24 "Arial"
        END DISPLAY
        BEGIN DISPLAY 924 1612 TEXT (840Hz)
            FONT 24 "Arial"
        END DISPLAY
        BEGIN BRANCH btn0
            WIRE 288 800 320 800
            WIRE 320 800 336 800
        END BRANCH
        BEGIN INSTANCE XLXI_36 3360 1824 R0
        END INSTANCE
        BEGIN BRANCH LEDS(7:0)
            WIRE 3824 1776 4256 1776
        END BRANCH
        BEGIN BRANCH Velocidade(7:0)
            WIRE 3824 1632 4256 1632
        END BRANCH
        BEGIN BRANCH Display(11:0)
            WIRE 3824 1488 4240 1488
        END BRANCH
        BEGIN BRANCH Aquecer
            WIRE 3824 1344 4240 1344
        END BRANCH
        BEGIN BRANCH LEDS(1)
            WIRE 5824 2208 6192 2208
            WIRE 6192 2208 6240 2208
        END BRANCH
        INSTANCE XLXI_37 5296 800 R0
        BEGIN BRANCH Sel(1:0)
            WIRE 3136 1792 3360 1792
        END BRANCH
    END SHEET
END SCHEMATIC
