//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_GetPtrStri
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    05/06/2010 12:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_10;0)
	//ARRAY TEXT(LB_at_01_11;0)
	//ARRAY TEXT(LB_at_01_12;0)
	//ARRAY TEXT(LB_at_01_13;0)
	//ARRAY TEXT(LB_at_01_14;0)
	//ARRAY TEXT(LB_at_01_15;0)
	//ARRAY TEXT(LB_at_01_16;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	//ARRAY TEXT(LB_at_01_4;0)
	//ARRAY TEXT(LB_at_01_5;0)
	//ARRAY TEXT(LB_at_01_6;0)
	//ARRAY TEXT(LB_at_01_7;0)
	//ARRAY TEXT(LB_at_01_8;0)
	//ARRAY TEXT(LB_at_01_9;0)
	//ARRAY TEXT(LB_at_02_1;0)
	//ARRAY TEXT(LB_at_02_10;0)
	//ARRAY TEXT(LB_at_02_11;0)
	//ARRAY TEXT(LB_at_02_12;0)
	//ARRAY TEXT(LB_at_02_13;0)
	//ARRAY TEXT(LB_at_02_14;0)
	//ARRAY TEXT(LB_at_02_15;0)
	//ARRAY TEXT(LB_at_02_16;0)
	//ARRAY TEXT(LB_at_02_2;0)
	//ARRAY TEXT(LB_at_02_3;0)
	//ARRAY TEXT(LB_at_02_4;0)
	//ARRAY TEXT(LB_at_02_5;0)
	//ARRAY TEXT(LB_at_02_6;0)
	//ARRAY TEXT(LB_at_02_7;0)
	//ARRAY TEXT(LB_at_02_8;0)
	//ARRAY TEXT(LB_at_02_9;0)
	//ARRAY TEXT(LB_at_03_1;0)
	//ARRAY TEXT(LB_at_03_10;0)
	//ARRAY TEXT(LB_at_03_11;0)
	//ARRAY TEXT(LB_at_03_12;0)
	//ARRAY TEXT(LB_at_03_13;0)
	//ARRAY TEXT(LB_at_03_14;0)
	//ARRAY TEXT(LB_at_03_15;0)
	//ARRAY TEXT(LB_at_03_16;0)
	//ARRAY TEXT(LB_at_03_2;0)
	//ARRAY TEXT(LB_at_03_3;0)
	//ARRAY TEXT(LB_at_03_4;0)
	//ARRAY TEXT(LB_at_03_5;0)
	//ARRAY TEXT(LB_at_03_6;0)
	//ARRAY TEXT(LB_at_03_7;0)
	//ARRAY TEXT(LB_at_03_8;0)
	//ARRAY TEXT(LB_at_03_9;0)
	//ARRAY TEXT(LB_at_04_1;0)
	//ARRAY TEXT(LB_at_04_10;0)
	//ARRAY TEXT(LB_at_04_11;0)
	//ARRAY TEXT(LB_at_04_12;0)
	//ARRAY TEXT(LB_at_04_13;0)
	//ARRAY TEXT(LB_at_04_14;0)
	//ARRAY TEXT(LB_at_04_15;0)
	//ARRAY TEXT(LB_at_04_16;0)
	//ARRAY TEXT(LB_at_04_2;0)
	//ARRAY TEXT(LB_at_04_3;0)
	//ARRAY TEXT(LB_at_04_4;0)
	//ARRAY TEXT(LB_at_04_5;0)
	//ARRAY TEXT(LB_at_04_6;0)
	//ARRAY TEXT(LB_at_04_7;0)
	//ARRAY TEXT(LB_at_04_8;0)
	//ARRAY TEXT(LB_at_04_9;0)
	//ARRAY TEXT(LB_at_05_1;0)
	//ARRAY TEXT(LB_at_05_10;0)
	//ARRAY TEXT(LB_at_05_11;0)
	//ARRAY TEXT(LB_at_05_12;0)
	//ARRAY TEXT(LB_at_05_13;0)
	//ARRAY TEXT(LB_at_05_14;0)
	//ARRAY TEXT(LB_at_05_15;0)
	//ARRAY TEXT(LB_at_05_2;0)
	//ARRAY TEXT(LB_at_05_3;0)
	//ARRAY TEXT(LB_at_05_4;0)
	//ARRAY TEXT(LB_at_05_5;0)
	//ARRAY TEXT(LB_at_05_6;0)
	//ARRAY TEXT(LB_at_05_7;0)
	//ARRAY TEXT(LB_at_05_8;0)
	//ARRAY TEXT(LB_at_05_9;0)
	//ARRAY TEXT(LB_at_06_1;0)
	//ARRAY TEXT(LB_at_06_10;0)
	//ARRAY TEXT(LB_at_06_11;0)
	//ARRAY TEXT(LB_at_06_12;0)
	//ARRAY TEXT(LB_at_06_13;0)
	//ARRAY TEXT(LB_at_06_14;0)
	//ARRAY TEXT(LB_at_06_15;0)
	//ARRAY TEXT(LB_at_06_2;0)
	//ARRAY TEXT(LB_at_06_3;0)
	//ARRAY TEXT(LB_at_06_4;0)
	//ARRAY TEXT(LB_at_06_5;0)
	//ARRAY TEXT(LB_at_06_6;0)
	//ARRAY TEXT(LB_at_06_7;0)
	//ARRAY TEXT(LB_at_06_8;0)
	//ARRAY TEXT(LB_at_06_9;0)
	C_LONGINT:C283($2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtrStri")

//NG 21/7/2006 this is a replacement method for ALGetPtr_
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtr_")
//ALGetPtr_ - an alternative to Get Pointer
//it is much slower uncompiled, but proves 3x faster compiled
If ($2>0) & ($2<33)  //NG Modified April 2004 to cope with more columns
	
	$0:=Get pointer:C304("LB_at_"+$1+"_"+String:C10($2))
Else 
	Case of 
		: ($1="01")
			Case of 
				: ($2=1)
					$0:=->LB_at_01_1
				: ($2=2)
					$0:=->LB_at_01_2
				: ($2=3)
					$0:=->LB_at_01_3
				: ($2=4)
					$0:=->LB_at_01_4
				: ($2=5)
					$0:=->LB_at_01_5
				: ($2=6)
					$0:=->LB_at_01_6
				: ($2=7)
					$0:=->LB_at_01_7
				: ($2=8)
					$0:=->LB_at_01_8
				: ($2=9)
					$0:=->LB_at_01_9
				: ($2=10)
					$0:=->LB_at_01_10
				: ($2=11)
					$0:=->LB_at_01_11
				: ($2=12)
					$0:=->LB_at_01_12
				: ($2=13)
					$0:=->LB_at_01_13
				: ($2=14)
					$0:=->LB_at_01_14
				: ($2=15)
					$0:=->LB_at_01_15
				: ($2=16)
					$0:=->LB_at_01_16
			End case 
		: ($1="02")
			Case of 
				: ($2=1)
					$0:=->LB_at_02_1
				: ($2=2)
					$0:=->LB_at_02_2
				: ($2=3)
					$0:=->LB_at_02_3
				: ($2=4)
					$0:=->LB_at_02_4
				: ($2=5)
					$0:=->LB_at_02_5
				: ($2=6)
					$0:=->LB_at_02_6
				: ($2=7)
					$0:=->LB_at_02_7
				: ($2=8)
					$0:=->LB_at_02_8
				: ($2=9)
					$0:=->LB_at_02_9
				: ($2=10)
					$0:=->LB_at_02_10
				: ($2=11)
					$0:=->LB_at_02_11
				: ($2=12)
					$0:=->LB_at_02_12
				: ($2=13)
					$0:=->LB_at_02_13
				: ($2=14)
					$0:=->LB_at_02_14
				: ($2=15)
					$0:=->LB_at_02_15
				: ($2=16)
					$0:=->LB_at_02_16
			End case 
		: ($1="03")
			Case of 
				: ($2=1)
					$0:=->LB_at_03_1
				: ($2=2)
					$0:=->LB_at_03_2
				: ($2=3)
					$0:=->LB_at_03_3
				: ($2=4)
					$0:=->LB_at_03_4
				: ($2=5)
					$0:=->LB_at_03_5
				: ($2=6)
					$0:=->LB_at_03_6
				: ($2=7)
					$0:=->LB_at_03_7
				: ($2=8)
					$0:=->LB_at_03_8
				: ($2=9)
					$0:=->LB_at_03_9
				: ($2=10)
					$0:=->LB_at_03_10
				: ($2=11)
					$0:=->LB_at_03_11
				: ($2=12)
					$0:=->LB_at_03_12
				: ($2=13)
					$0:=->LB_at_03_13
				: ($2=14)
					$0:=->LB_at_03_14
				: ($2=15)
					$0:=->LB_at_03_15
				: ($2=16)
					$0:=->LB_at_03_16
			End case 
		: ($1="04")
			Case of 
				: ($2=1)
					$0:=->LB_at_04_1
				: ($2=2)
					$0:=->LB_at_04_2
				: ($2=3)
					$0:=->LB_at_04_3
				: ($2=4)
					$0:=->LB_at_04_4
				: ($2=5)
					$0:=->LB_at_04_5
				: ($2=6)
					$0:=->LB_at_04_6
				: ($2=7)
					$0:=->LB_at_04_7
				: ($2=8)
					$0:=->LB_at_04_8
				: ($2=9)
					$0:=->LB_at_04_9
				: ($2=10)
					$0:=->LB_at_04_10
				: ($2=11)
					$0:=->LB_at_04_11
				: ($2=12)
					$0:=->LB_at_04_12
				: ($2=13)
					$0:=->LB_at_04_13
				: ($2=14)
					$0:=->LB_at_04_14
				: ($2=15)
					$0:=->LB_at_04_15
				: ($2=16)
					$0:=->LB_at_04_16
			End case 
		: ($1="05")
			Case of 
				: ($2=1)
					$0:=->LB_at_05_1
				: ($2=2)
					$0:=->LB_at_05_2
				: ($2=3)
					$0:=->LB_at_05_3
				: ($2=4)
					$0:=->LB_at_05_4
				: ($2=5)
					$0:=->LB_at_05_5
				: ($2=6)
					$0:=->LB_at_05_6
				: ($2=7)
					$0:=->LB_at_05_7
				: ($2=8)
					$0:=->LB_at_05_8
				: ($2=9)
					$0:=->LB_at_05_9
				: ($2=10)
					$0:=->LB_at_05_10
				: ($2=11)
					$0:=->LB_at_05_11
				: ($2=12)
					$0:=->LB_at_05_12
				: ($2=13)
					$0:=->LB_at_05_13
				: ($2=14)
					$0:=->LB_at_05_14
				: ($2=15)
					$0:=->LB_at_05_15
				: ($2=16)
					$0:=->LB_at_05_15
			End case 
		: ($1="06")
			Case of 
				: ($2=1)
					$0:=->LB_at_06_1
				: ($2=2)
					$0:=->LB_at_06_2
				: ($2=3)
					$0:=->LB_at_06_3
				: ($2=4)
					$0:=->LB_at_06_4
				: ($2=5)
					$0:=->LB_at_06_5
				: ($2=6)
					$0:=->LB_at_06_6
				: ($2=7)
					$0:=->LB_at_06_7
				: ($2=8)
					$0:=->LB_at_06_8
				: ($2=9)
					$0:=->LB_at_06_9
				: ($2=10)
					$0:=->LB_at_06_10
				: ($2=11)
					$0:=->LB_at_06_11
				: ($2=12)
					$0:=->LB_at_06_12
				: ($2=13)
					$0:=->LB_at_06_13
				: ($2=14)
					$0:=->LB_at_06_14
				: ($2=15)
					$0:=->LB_at_06_15
				: ($2=16)
					$0:=->LB_at_06_15
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("LBi_GetPtr_"; $_t_oldMethodName)