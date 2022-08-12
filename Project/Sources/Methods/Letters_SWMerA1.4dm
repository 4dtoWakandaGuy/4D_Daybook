//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWMerA1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Stri1)
	//C_UNKNOWN(a01Stri2)
	//C_UNKNOWN(a01Stri3)
	//C_UNKNOWN(a01Stri4)
	ARRAY TEXT:C222($_at_AddressLine1; 0)
	ARRAY TEXT:C222($_at_Forenames; 0)
	ARRAY TEXT:C222($_at_Surnames; 0)
	ARRAY TEXT:C222($_at_Titles; 0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; vNo)
	C_TEXT:C284($_t_oldMethodName; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWMerA1")
//Letters_SWMerA1 - Array 1
vNo:=Records in selection:C76([CONTACTS:1])
If (vNo>100)
	REDUCE SELECTION:C351([CONTACTS:1]; 100)
	vTitle1:="First 100 Contacts of "+String:C10(vNo)+" found ..."
Else 
	vTitle1:=String:C10(vNo)+" Contact"+("s"*(Num:C11(vNo#1)))+" found ..."
End if 
//LBi_ArrDef01 
LBI_AddDef07to99(1)
LBI_ArrayDefPic(1)
LBI_arrayDefTime(1)
SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
SELECTION TO ARRAY:C260([CONTACTS:1]Title:3; $_at_Titles; [CONTACTS:1]Forename:4; $_at_Forenames; [CONTACTS:1]Surname:5; $_at_Surnames; [COMPANIES:2]Company_Name:2; a01Stri2; [COMPANIES:2]Address_Line_one:3; $_at_AddressLine1; [CONTACTS:1]Contact_Code:2; a01Stri3; [CONTACTS:1]Company_Code:1; a01Stri4)
SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
SORT ARRAY:C229($_at_Surnames; $_at_Forenames; $_at_Titles; a01Stri2; $_at_AddressLine1; a01Stri3; a01Stri4; >)
$_l_SizeofArray:=Size of array:C274($_at_Titles)
INSERT IN ARRAY:C227(a01Stri1; 1; $_l_SizeofArray)
For ($_l_Index; 1; $_l_SizeofArray)
	a01Stri1{$_l_Index}:=$_at_Titles{$_l_Index}+(" "*Num:C11($_at_Titles{$_l_Index}#""))+$_at_Forenames{$_l_Index}+(" "*Num:C11($_at_Forenames{$_l_Index}#""))+$_at_Surnames{$_l_Index}
	If (a01Stri2{$_l_Index}="")
		a01Stri2{$_l_Index}:=$_at_AddressLine1{$_l_Index}
	End if 
End for 
//AL_UpdateArrays (eALContI;-2)
ERR_MethodTrackerReturn("Letters_SWMerA1"; $_t_oldMethodName)