//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_GetPtrDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/07/2019
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(LB_ad_01_1;0)
	//ARRAY INTEGER(LB_ad_01_2;0)
	//ARRAY INTEGER(LB_ad_01_3;0)
	//ARRAY INTEGER(LB_ad_01_4;0)
	//ARRAY INTEGER(LB_ad_02_1;0)
	//ARRAY INTEGER(LB_ad_02_2;0)
	//ARRAY INTEGER(LB_ad_02_3;0)
	//ARRAY INTEGER(LB_ad_02_4;0)
	//ARRAY INTEGER(LB_ad_03_1;0)
	//ARRAY INTEGER(LB_ad_03_2;0)
	//ARRAY INTEGER(LB_ad_03_3;0)
	//ARRAY INTEGER(LB_ad_03_4;0)
	//ARRAY INTEGER(LB_ad_04_1;0)
	//ARRAY INTEGER(LB_ad_04_2;0)
	//ARRAY INTEGER(LB_ad_04_3;0)
	//ARRAY INTEGER(LB_ad_04_4;0)
	//ARRAY INTEGER(LB_ad_05_1;0)
	//ARRAY INTEGER(LB_ad_05_2;0)
	//ARRAY INTEGER(LB_ad_05_3;0)
	//ARRAY INTEGER(LB_ad_05_4;0)
	//ARRAY INTEGER(LB_ad_06_1;0)
	//ARRAY INTEGER(LB_ad_06_2;0)
	//ARRAY INTEGER(LB_ad_06_3;0)
	//ARRAY INTEGER(LB_ad_06_4;0)
	C_LONGINT:C283($2)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtrDate")

//NG 20/7/06 This method is a replacemnent for ALGetptr_
$_t_oldMethodName:=ERR_MethodTracker("LBi_GetPtr_")
//ALGetPtr_ - an alternative to Get Pointer
//it is much slower uncompiled, but proves 3x faster compiled
If ($2>0) & ($2<33)  //NG Modified April 2004 to copy with more columns
	
	$0:=Get pointer:C304("LB_ad_"+$1+"_"+String:C10($2))
Else 
	Case of 
		: ($1="01")
			Case of 
				: ($2=1)
					$0:=->LB_ad_01_1
				: ($2=2)
					$0:=->LB_ad_01_2
				: ($2=3)
					$0:=->LB_ad_01_3
				: ($2=4)
					$0:=->LB_ad_01_4
			End case 
		: ($1="02")
			Case of 
				: ($2=1)
					$0:=->LB_ad_02_1
				: ($2=2)
					$0:=->LB_ad_02_2
				: ($2=3)
					$0:=->LB_ad_02_3
				: ($2=4)
					$0:=->LB_ad_02_4
			End case 
		: ($1="03")
			Case of 
				: ($2=1)
					$0:=->LB_ad_03_1
				: ($2=2)
					$0:=->LB_ad_03_2
				: ($2=3)
					$0:=->LB_ad_03_3
				: ($2=4)
					$0:=->LB_ad_03_4
			End case 
		: ($1="04")
			Case of 
				: ($2=1)
					$0:=->LB_ad_04_1
				: ($2=2)
					$0:=->LB_ad_04_2
				: ($2=3)
					$0:=->LB_ad_04_3
				: ($2=4)
					$0:=->LB_ad_04_4
			End case 
		: ($1="05")
			Case of 
				: ($2=1)
					$0:=->LB_ad_05_1
				: ($2=2)
					$0:=->LB_ad_05_2
				: ($2=3)
					$0:=->LB_ad_05_3
				: ($2=4)
					$0:=->LB_ad_05_4
			End case 
		: ($1="06")
			Case of 
				: ($2=1)
					$0:=->LB_ad_06_1
				: ($2=2)
					$0:=->LB_ad_06_2
				: ($2=3)
					$0:=->LB_ad_06_3
				: ($2=4)
					$0:=->LB_ad_06_4
			End case 
		Else 
			
	End case 
End if 
ERR_MethodTrackerReturn("LBi_GetPtr_"; $_t_oldMethodName)