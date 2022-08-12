//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_GetPtrBoolean
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(LB_abo_01_1;0)
	//Array BOOLEAN(LB_abo_01_2;0)
	//Array BOOLEAN(LB_abo_02_1;0)
	//Array BOOLEAN(LB_abo_02_2;0)
	//Array BOOLEAN(LB_abo_03_1;0)
	//Array BOOLEAN(LB_abo_04_1;0)
	//Array BOOLEAN(LB_abo_04_2;0)
	//Array BOOLEAN(LB_abo_05_1;0)
	//Array BOOLEAN(LB_abo_05_2;0)
	//Array BOOLEAN(LB_abo_06_1;0)
	//Array BOOLEAN(LB_abo_06_2;0)
	C_LONGINT:C283($2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtrBoolean")

//NG 21/7/2006 this method is a direct replacement for ALGetPtrBool
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtrBoolean")
//ALGetPtrBool - an alternative to Get Pointer
//it is much slower uncompiled, but proves 3x faster compiled
If ($2>0) & ($2<33)  //NG Modified April 2004 to copy with more columns
	$0:=Get pointer:C304("LB_abo_"+$1+"_"+String:C10($2))
	//$0:=Get pointer("a"+$1+"Bool"+String($2))
Else 
	Case of 
		: ($1="01")
			Case of 
				: ($2=1)
					$0:=->LB_abo_01_1
				: ($2=2)
					$0:=->LB_abo_01_2
			End case 
		: ($1="02")
			Case of 
				: ($2=1)
					$0:=->LB_abo_02_1
				: ($2=2)
					$0:=->LB_abo_02_2
			End case 
		: ($1="03")
			Case of 
				: ($2=1)
					$0:=->LB_abo_03_1
				: ($2=2)
					$0:=->LB_abo_04_2
			End case 
		: ($1="04")
			Case of 
				: ($2=1)
					$0:=->LB_abo_04_1
				: ($2=2)
					$0:=->LB_abo_04_2
			End case 
		: ($1="05")
			Case of 
				: ($2=1)
					$0:=->LB_abo_05_1
				: ($2=2)
					$0:=->LB_abo_05_2
			End case 
		: ($1="06")
			Case of 
				: ($2=1)
					$0:=->LB_abo_06_1
				: ($2=2)
					$0:=->LB_abo_06_2
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("LBi_GetPtrBoolean"; $_t_oldMethodName)