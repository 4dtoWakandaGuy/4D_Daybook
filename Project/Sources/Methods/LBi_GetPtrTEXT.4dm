//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_GetPtrTEXT
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
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_02_1;0)
	//ARRAY TEXT(LB_at_02_2;0)
	//ARRAY TEXT(LB_at_03_1;0)
	//ARRAY TEXT(LB_at_03_2;0)
	//ARRAY TEXT(LB_at_04_1;0)
	//ARRAY TEXT(LB_at_04_2;0)
	//ARRAY TEXT(LB_at_05_1;0)
	//ARRAY TEXT(LB_at_05_2;0)
	//ARRAY TEXT(LB_at_06_1;0)
	//ARRAY TEXT(LB_at_06_2;0)
	C_LONGINT:C283($2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtrTEXT")

//NG 21/7/06 This method is a direct replacement for  ALGetPtr_
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
			End case 
		: ($1="02")
			Case of 
				: ($2=1)
					$0:=->LB_at_02_1
				: ($2=2)
					$0:=->LB_at_02_2
			End case 
		: ($1="03")
			Case of 
				: ($2=1)
					$0:=->LB_at_03_1
				: ($2=2)
					$0:=->LB_at_03_2
			End case 
		: ($1="04")
			Case of 
				: ($2=1)
					$0:=->LB_at_04_1
				: ($2=2)
					$0:=->LB_at_04_2
			End case 
		: ($1="05")
			Case of 
				: ($2=1)
					$0:=->LB_at_05_1
				: ($2=2)
					$0:=->LB_at_05_2
			End case 
		: ($1="06")
			Case of 
				: ($2=1)
					$0:=->LB_at_06_1
				: ($2=2)
					$0:=->LB_at_06_2
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("LBi_GetPtr_"; $_t_oldMethodName)