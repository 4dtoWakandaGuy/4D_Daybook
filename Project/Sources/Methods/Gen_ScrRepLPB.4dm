//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ScrRepLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Real1)
	//ARRAY REAL(a01Real3;0)
	//ARRAY REAL(a01Real4;0)
	//ARRAY REAL(a01Real5;0)
	//ARRAY REAL(a01Real6;0)
	//ARRAY REAL(INV_ar_TotalDue;0)
	//ARRAY TEXT(a01Stri1;0)
	//ARRAY TEXT(a01Stri2;0)
	C_LONGINT:C283($_l_SizeofArray)
	C_REAL:C285(vT1)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ScrRepLPB")
//Gen_ScrRepLPB

//LBi_ArrDef01 
LBI_AddDef07to99(1)
LBI_ArrayDefPic(1)
LBI_arrayDefTime(1)
ARRAY REAL:C219(INV_ar_TotalDue; 0)
ARRAY TEXT:C222(a01Stri1; 0)
ARRAY TEXT:C222(a01Stri2; 0)
Case of 
	: (vTitle=Term_SLPLWT("Debtors@"))
		SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; a01Stri1; [COMPANIES:2]Company_Name:2; a01Stri2; [COMPANIES:2]Sales_Credit:35; a01Real1)
	: (vTitle=Term_SLPLWT("Creditors@"))
		SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; a01Stri1; [COMPANIES:2]Company_Name:2; a01Stri2; [COMPANIES:2]Purchase_Credit:36; a01Real1)
End case 
SORT ARRAY:C229(a01Stri2; a01Stri1; a01Real1; >)
$_l_SizeofArray:=Size of array:C274(a01Stri1)
ARRAY REAL:C219(INV_ar_TotalDue; $_l_SizeofArray)
ARRAY REAL:C219(a01Real3; $_l_SizeofArray)
ARRAY REAL:C219(a01Real4; $_l_SizeofArray)
ARRAY REAL:C219(a01Real5; $_l_SizeofArray)
ARRAY REAL:C219(a01Real6; $_l_SizeofArray)
vT1:=Gen_Round((Sum:C1([COMPANIES:2]Sales_Credit:35)); 2; 2)
ERR_MethodTrackerReturn("Gen_ScrRepLPB"; $_t_oldMethodName)
