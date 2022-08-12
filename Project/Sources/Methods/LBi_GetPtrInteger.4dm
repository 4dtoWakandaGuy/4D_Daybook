//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_GetPtrInteger
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/06/2010 12:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(LB_ai_01_1;0)
	//ARRAY INTEGER(LB_ai_01_2;0)
	//ARRAY INTEGER(LB_ai_01_3;0)
	//ARRAY INTEGER(LB_ai_01_4;0)
	//ARRAY INTEGER(LB_ai_02_1;0)
	//ARRAY INTEGER(LB_ai_02_2;0)
	//ARRAY INTEGER(LB_ai_02_3;0)
	//ARRAY INTEGER(LB_ai_02_4;0)
	//ARRAY INTEGER(LB_ai_03_1;0)
	//ARRAY INTEGER(LB_ai_03_2;0)
	//ARRAY INTEGER(LB_ai_03_3;0)
	//ARRAY INTEGER(LB_ai_03_4;0)
	//ARRAY INTEGER(LB_ai_04_1;0)
	//ARRAY INTEGER(LB_ai_04_2;0)
	//ARRAY INTEGER(LB_ai_04_3;0)
	//ARRAY INTEGER(LB_ai_04_4;0)
	//ARRAY INTEGER(LB_ai_05_1;0)
	//ARRAY INTEGER(LB_ai_05_2;0)
	//ARRAY INTEGER(LB_ai_05_3;0)
	//ARRAY INTEGER(LB_ai_05_4;0)
	//ARRAY INTEGER(LB_ai_06_1;0)
	//ARRAY INTEGER(LB_ai_06_2;0)
	//ARRAY INTEGER(LB_ai_06_3;0)
	//ARRAY INTEGER(LB_ai_06_4;0)
	C_LONGINT:C283($2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtrInteger")

//NG 20/7/06 This method is a replacement for ALGetPtr_
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtr_ger")
//ALGetPtr_ - an alternative to Get Po_r
//it is much slower uncompiled, but proves 3x faster compiled
If ($2>0) & ($2<33)  //NG Modified April 2004 to cope with more columns
	
	$0:=Get pointer:C304("LB_ai_"+$1+"_"+String:C10($2))
Else 
	Case of 
		: ($1="01")
			Case of 
				: ($2=1)
					$0:=->LB_ai_01_1
				: ($2=2)
					$0:=->LB_ai_01_2
				: ($2=3)
					$0:=->LB_ai_01_3
				: ($2=4)
					$0:=->LB_ai_01_4
			End case 
		: ($1="02")
			Case of 
				: ($2=1)
					$0:=->LB_ai_02_1
				: ($2=2)
					$0:=->LB_ai_02_2
				: ($2=3)
					$0:=->LB_ai_02_3
				: ($2=4)
					$0:=->LB_ai_02_4
			End case 
		: ($1="03")
			Case of 
				: ($2=1)
					$0:=->LB_ai_03_1
				: ($2=2)
					$0:=->LB_ai_03_2
				: ($2=3)
					$0:=->LB_ai_03_3
				: ($2=4)
					$0:=->LB_ai_03_4
			End case 
		: ($1="04")
			Case of 
				: ($2=1)
					$0:=->LB_ai_04_1
				: ($2=2)
					$0:=->LB_ai_04_2
				: ($2=3)
					$0:=->LB_ai_04_3
				: ($2=4)
					$0:=->LB_ai_04_4
			End case 
		: ($1="05")
			Case of 
				: ($2=1)
					$0:=->LB_ai_05_1
				: ($2=2)
					$0:=->LB_ai_05_2
				: ($2=3)
					$0:=->LB_ai_05_3
				: ($2=4)
					$0:=->LB_ai_05_4
			End case 
		: ($1="06")
			Case of 
				: ($2=1)
					$0:=->LB_ai_06_1
				: ($2=2)
					$0:=->LB_ai_06_2
				: ($2=3)
					$0:=->LB_ai_06_3
				: ($2=4)
					$0:=->LB_ai_06_4
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("LBi_GetPtr_ger"; $_t_oldMethodName)