//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_AgdeptScreenReportAddSub
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
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName; vTitle; vtitle1; Vtitle11; Vtitle2; vtitle3; vtitle4)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("INV_AgdeptScreenReportAddSub")

//NG Feb 2004
//This method replaces the script in the button Xreport on the form
//[invoices]dScreenReport
$_t_oldMethodName:=ERR_MethodTracker("INV_AgdeptScreenReportAddSub"; Form event code:C388)


Case of 
	: ((vTitle="Sales@") | (vTitle="Purch@"))
		$_l_SizeofArray:=Size of array:C274(LB_at_01_1)
		INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeofArray+1; 1)
		INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeofArray+1; 1)
		INSERT IN ARRAY:C227(LB_at_01_3; $_l_SizeofArray+1; 1)
		INSERT IN ARRAY:C227(LB_ad_01_1; $_l_SizeofArray+1; 1)
		INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeofArray+1; 1)
		vT1:=0
		For ($_l_Index; 1; $_l_SizeofArray)
			vT1:=vT1+LB_ar_01_1{$_l_Index}
		End for 
		ARRAY TEXT:C222($_at_Columns; 2)
		ARRAY TEXT:C222($_at_Values; 2)
		ARRAY TEXT:C222($_at_Formats; 2)
		$_at_Columns{1}:=Vtitle11
		$_at_Values{1}:=String:C10($_l_SizeofArray+1)
		$_at_Formats{1}:=""
		
		$_at_Columns{2}:=Vtitle2
		$_at_Values{2}:=String:C10(VT1)
		$_at_Formats{2}:="|Accounts"
		
		LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
		
	: (vTitle="Gene@")
		$_l_SizeofArray:=Size of array:C274(LB_at_01_1)
		INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeofArray+1; 1)
		INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeofArray+1; 1)
		INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeofArray+1; 1)
		INSERT IN ARRAY:C227(LB_ar_01_2; $_l_SizeofArray+1; 1)
		vT1:=0
		vT2:=0
		For ($_l_Index; 1; $_l_SizeofArray)
			vT1:=vT1+LB_ar_01_1{$_l_Index}
			vT2:=vT2+LB_ar_01_2{$_l_Index}
		End for 
		ARRAY TEXT:C222($_at_Columns; 4)
		ARRAY TEXT:C222($_at_Values; 4)
		ARRAY TEXT:C222($_at_Formats; 4)
		$_at_Columns{1}:=vtitle1
		$_at_Values{1}:=String:C10($_l_SizeofArray+1)
		$_at_Formats{1}:=""
		
		$_at_Columns{2}:=Vtitle2
		$_at_Values{2}:="Difference:"+String:C10(Round:C94(vT1-vT2; 2))
		$_at_Formats{2}:="|Accounts"
		$_at_Columns{3}:=vtitle3
		$_at_Values{3}:=String:C10(vT1)
		$_at_Formats{3}:="|Accounts"
		$_at_Columns{4}:=vtitle4
		$_at_Values{4}:=String:C10(vT2)
		$_at_Formats{4}:="|Accounts"
		
		LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
End case 

GOTO OBJECT:C206(GEN_lb_ItemsArea)
//AL_UpdateArrays (GEN_lb_ItemsArea;$_l_SizeofArray+1)
//LB_GoToCell (GEN_lb_ItemsArea;1;$_l_SizeofArray+1) NG TODO
//LB_SetScroll (GEN_lb_ItemsArea;$_l_SizeofArray+1;1)
ERR_MethodTrackerReturn("INV_AgdeptScreenReportAddSub"; $_t_oldMethodName)