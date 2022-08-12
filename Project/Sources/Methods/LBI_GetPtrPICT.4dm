//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_GetPtrPICT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/06/2010 12:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY PICTURE(LB_aPic_01_1;0)
	//ARRAY PICTURE(LB_aPic_01_2;0)
	//ARRAY PICTURE(LB_aPic_01_3;0)
	//ARRAY PICTURE(LB_aPic_01_4;0)
	//ARRAY PICTURE(LB_aPic_01_5;0)
	//ARRAY PICTURE(LB_aPic_01_6;0)
	//ARRAY PICTURE(LB_aPic_01_7;0)
	//ARRAY PICTURE(LB_aPic_01_8;0)
	//ARRAY PICTURE(LB_aPic_01_9;0)
	//ARRAY PICTURE(LB_aPic_02_1;0)
	//ARRAY PICTURE(LB_aPic_02_2;0)
	//ARRAY PICTURE(LB_aPic_02_3;0)
	//ARRAY PICTURE(LB_aPic_02_4;0)
	//ARRAY PICTURE(LB_aPic_02_5;0)
	//ARRAY PICTURE(LB_aPic_02_6;0)
	//ARRAY PICTURE(LB_aPic_02_7;0)
	//ARRAY PICTURE(LB_aPic_02_8;0)
	//ARRAY PICTURE(LB_aPic_02_9;0)
	//ARRAY PICTURE(LB_aPic_03_1;0)
	//ARRAY PICTURE(LB_aPic_03_2;0)
	//ARRAY PICTURE(LB_aPic_03_3;0)
	//ARRAY PICTURE(LB_aPic_03_4;0)
	//ARRAY PICTURE(LB_aPic_03_5;0)
	//ARRAY PICTURE(LB_aPic_03_6;0)
	//ARRAY PICTURE(LB_aPic_03_7;0)
	//ARRAY PICTURE(LB_aPic_03_8;0)
	//ARRAY PICTURE(LB_aPic_03_9;0)
	//ARRAY PICTURE(LB_aPic_04_1;0)
	//ARRAY PICTURE(LB_aPic_04_2;0)
	//ARRAY PICTURE(LB_aPic_04_3;0)
	//ARRAY PICTURE(LB_aPic_04_4;0)
	//ARRAY PICTURE(LB_aPic_04_5;0)
	//ARRAY PICTURE(LB_aPic_04_6;0)
	//ARRAY PICTURE(LB_aPic_04_7;0)
	//ARRAY PICTURE(LB_aPic_04_8;0)
	//ARRAY PICTURE(LB_aPic_04_9;0)
	//ARRAY PICTURE(LB_aPic_05_1;0)
	//ARRAY PICTURE(LB_aPic_05_2;0)
	//ARRAY PICTURE(LB_aPic_05_3;0)
	//ARRAY PICTURE(LB_aPic_05_4;0)
	//ARRAY PICTURE(LB_aPic_05_5;0)
	//ARRAY PICTURE(LB_aPic_05_6;0)
	//ARRAY PICTURE(LB_aPic_05_7;0)
	//ARRAY PICTURE(LB_aPic_05_8;0)
	//ARRAY PICTURE(LB_aPic_05_9;0)
	//ARRAY PICTURE(LB_aPic_06_1;0)
	//ARRAY PICTURE(LB_aPic_06_2;0)
	//ARRAY PICTURE(LB_aPic_06_3;0)
	//ARRAY PICTURE(LB_aPic_06_4;0)
	//ARRAY PICTURE(LB_aPic_06_5;0)
	//ARRAY PICTURE(LB_aPic_06_6;0)
	//ARRAY PICTURE(LB_aPic_06_7;0)
	//ARRAY PICTURE(LB_aPic_06_8;0)
	//ARRAY PICTURE(LB_aPic_06_9;0)
	C_LONGINT:C283($2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName; $_t_prefix; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBI_GetPtrPICT")

//NG 21/7/2006
//This method is a direct replacement for ALGetPtr_
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtr_")
//ALGetPtr_ - an alternative to Get Pointer
//it is much slower uncompiled, but proves 3x faster compiled

If (Count parameters:C259>=2)
	If ($2>0) & ($2<33)  //NG Modified April 2004 to cope with more columns
		
		$0:=Get pointer:C304("LB_aPic_"+$1+"_"+String:C10($2))
	Else 
		Case of 
			: ($1="01")
				Case of 
					: ($2=1)
						$0:=->LB_aPic_01_1
					: ($2=2)
						$0:=->LB_aPic_01_2
					: ($2=3)
						$0:=->LB_aPic_01_3
					: ($2=4)
						$0:=->LB_aPic_01_4
					: ($2=5)
						$0:=->LB_aPic_01_5
					: ($2=6)
						$0:=->LB_aPic_01_6
					: ($2=7)
						$0:=->LB_aPic_01_7
					: ($2=8)
						$0:=->LB_aPic_01_8
					: ($2=9)
						$0:=->LB_aPic_01_9
				End case 
			: ($1="02")
				Case of 
					: ($2=1)
						$0:=->LB_aPic_02_1
					: ($2=2)
						$0:=->LB_aPic_02_2
					: ($2=3)
						$0:=->LB_aPic_02_3
					: ($2=4)
						$0:=->LB_aPic_02_4
					: ($2=5)
						$0:=->LB_aPic_02_5
					: ($2=6)
						$0:=->LB_aPic_02_6
					: ($2=7)
						$0:=->LB_aPic_02_7
					: ($2=8)
						$0:=->LB_aPic_02_8
					: ($2=9)
						$0:=->LB_aPic_02_9
					Else 
						$0:=Get pointer:C304("LB_apic_02_"+String:C10($2))
						
				End case 
			: ($1="03")
				Case of 
					: ($2=1)
						$0:=->LB_aPic_03_1
					: ($2=2)
						$0:=->LB_aPic_03_2
					: ($2=3)
						$0:=->LB_aPic_03_3
					: ($2=4)
						$0:=->LB_aPic_03_4
					: ($2=5)
						$0:=->LB_aPic_03_5
					: ($2=6)
						$0:=->LB_aPic_03_6
					: ($2=7)
						$0:=->LB_aPic_03_7
					: ($2=8)
						$0:=->LB_aPic_03_8
					: ($2=9)
						$0:=->LB_aPic_03_9
				End case 
			: ($1="04")
				Case of 
					: ($2=1)
						$0:=->LB_aPic_04_1
					: ($2=2)
						$0:=->LB_aPic_04_2
					: ($2=3)
						$0:=->LB_aPic_04_3
					: ($2=4)
						$0:=->LB_aPic_04_4
					: ($2=5)
						$0:=->LB_aPic_04_5
					: ($2=6)
						$0:=->LB_aPic_04_6
					: ($2=7)
						$0:=->LB_aPic_04_7
					: ($2=8)
						$0:=->LB_aPic_04_8
					: ($2=9)
						$0:=->LB_aPic_04_9
				End case 
			: ($1="05")
				Case of 
					: ($2=1)
						$0:=->LB_aPic_05_1
					: ($2=2)
						$0:=->LB_aPic_05_2
					: ($2=3)
						$0:=->LB_aPic_05_3
					: ($2=4)
						$0:=->LB_aPic_05_4
					: ($2=5)
						$0:=->LB_aPic_05_5
					: ($2=6)
						$0:=->LB_aPic_05_6
					: ($2=7)
						$0:=->LB_aPic_05_7
					: ($2=8)
						$0:=->LB_aPic_05_8
					: ($2=9)
						$0:=->LB_aPic_05_9
				End case 
			: ($1="06")
				Case of 
					: ($2=1)
						$0:=->LB_aPic_06_1
					: ($2=2)
						$0:=->LB_aPic_06_2
					: ($2=3)
						$0:=->LB_aPic_06_3
					: ($2=4)
						$0:=->LB_aPic_06_4
					: ($2=5)
						$0:=->LB_aPic_06_5
					: ($2=6)
						$0:=->LB_aPic_06_6
					: ($2=7)
						$0:=->LB_aPic_06_7
					: ($2=8)
						$0:=->LB_aPic_06_8
					: ($2=9)
						$0:=->LB_aPic_06_9
				End case 
		End case 
	End if 
	
End if 
ERR_MethodTrackerReturn("LBi_GetPtr_"; $_t_oldMethodName)