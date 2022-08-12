//%attributes = {}
If (False:C215)
	//Project Method Name:      ACCBalance_addSubentity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY DATE(LB_ad_02_1;0)
	ARRAY LONGINT:C221($_al_Columns; 0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	//ARRAY TEXT(LB_at_01Stri1;0)
	C_BOOLEAN:C305(<>ALUseListBox)
	C_LONGINT:C283($_l_FooterColumn; $_l_Index; $_l_SizeofArray; LBI_l_FooterSet)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACCBalance_addSubentity")

//NG Feb 2004
//This code simply replaces the script in the button xreport on the form
//[companies]dOpening_Bal. Although this form is in the companies table
// it is actually for setting up account balances which is why the method relates to accbalance

$_t_oldMethodName:=ERR_MethodTracker("ACCBalance_addSubentity"; Form event code:C388)
If (<>ALUseListBox)
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
				//IDLE  `7/04/03 pb
				vT1:=vT1+LB_ar_01_1{$_l_Index}
			End for 
			ARRAY LONGINT:C221($_al_Columns; 2)
			ARRAY TEXT:C222($_at_Values; 2)
			ARRAY TEXT:C222($_at_Formats; 2)
			$_al_Columns{1}:=1
			$_al_Columns{2}:=5
			$_at_Values{2}:=String:C10(VT1)
			$_at_Values{1}:=String:C10($_l_SizeofArray+1)
			$_at_Formats{2}:="|Accounts"
			LBI_l_FooterSet:=1
			$_l_FooterColumn:=1
			
			$_l_FooterColumn:=LB_SetFooters(->GEN_lb_ItemsArea; 1; 2; $_l_FooterColumn; $_at_Values{1}; "Total Customers"; $_at_Values{2}; "Total Outstanding")
			
			
		: (vTitle="Gene@")
			$_l_SizeofArray:=Size of array:C274(LB_at_01_1)
			INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_ar_01_2; $_l_SizeofArray+1; 1)
			vT1:=0
			vT2:=0
			For ($_l_Index; 1; $_l_SizeofArray)
				IDLE:C311  //7/04/03 pb
				vT1:=vT1+LB_ar_01_1{$_l_Index}
				vT2:=vT2+LB_ar_01_2{$_l_Index}
			End for 
			ARRAY LONGINT:C221($_al_Columns; 4)
			ARRAY TEXT:C222($_at_Values; 4)
			ARRAY TEXT:C222($_at_Formats; 4)
			$_al_Columns{1}:=1
			$_al_Columns{2}:=2
			$_al_Columns{3}:=3
			$_al_Columns{4}:=4
			
			$_at_Values{1}:=String:C10($_l_SizeofArray+1)
			$_at_Values{2}:="Difference"+String:C10(Round:C94((vT1-vT2); 2))
			$_at_Values{3}:=String:C10(vT1)
			$_at_Values{4}:=String:C10(vT2)
			$_at_Formats{2}:="|Accounts"
			$_at_Formats{3}:="|Accounts"
			$_at_Formats{4}:="|Accounts"
			LBI_l_FooterSet:=1
			$_l_FooterColumn:=1
			
			$_l_FooterColumn:=LB_SetFooters(->GEN_lb_ItemsArea; 1; 4; $_l_FooterColumn; $_at_Values{1}; "Account Balance"; $_at_Values{2}; "Total Accounts"; $_at_Values{3}; "Debit Amount"; $_at_Values{4}; "Credit Amount")
			
			
	End case 
	GOTO OBJECT:C206(GEN_lb_ItemsArea)
	LB_GoToCell(->GEN_lb_ItemsArea; 1; $_l_SizeofArray+1)
	LB_SetScroll(->GEN_lb_ItemsArea; $_l_SizeofArray+1; 1)
	
	
Else 
	Case of 
		: ((vTitle="Sales@") | (vTitle="Purch@"))
			$_l_SizeofArray:=Size of array:C274(LB_at_01_1)
			INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_at_01_3; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_ad_02_1; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeofArray+1; 1)
			vT1:=0
			For ($_l_Index; 1; $_l_SizeofArray)
				IDLE:C311  //7/04/03 pb
				vT1:=vT1+LB_ar_01_1{$_l_Index}
			End for 
			ARRAY LONGINT:C221($_al_Columns; 2)
			ARRAY TEXT:C222($_at_Values; 2)
			ARRAY TEXT:C222($_at_Formats; 2)
			$_al_Columns{1}:=1
			$_al_Columns{2}:=5
			
			
			$_at_Values{1}:=String:C10($_l_SizeofArray+1)
			$_at_Values{2}:=String:C10(vT1)
			$_at_Formats{2}:="|Accounts"
			LBI_l_FooterSet:=1
			$_l_FooterColumn:=1
			
			$_l_FooterColumn:=LB_SetFooters(->GEN_lb_ItemsArea; 1; 2; $_l_FooterColumn; $_at_Values{1}; "Total Customers"; $_at_Values{2}; "Total Outstanding")
			
			
		: (vTitle="Gene@")
			$_l_SizeofArray:=Size of array:C274(LB_at_01_1)
			INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeofArray+1; 1)
			INSERT IN ARRAY:C227(LB_ar_01_2; $_l_SizeofArray+1; 1)
			vT1:=0
			vT2:=0
			For ($_l_Index; 1; $_l_SizeofArray)
				IDLE:C311  //7/04/03 pb
				vT1:=vT1+LB_ar_01_1{$_l_Index}
				vT2:=vT2+LB_ar_01_2{$_l_Index}
			End for 
			ARRAY LONGINT:C221($_al_Columns; 4)
			ARRAY TEXT:C222($_at_Values; 4)
			ARRAY TEXT:C222($_at_Formats; 4)
			$_al_Columns{1}:=1
			$_al_Columns{2}:=2
			$_al_Columns{3}:=3
			$_al_Columns{4}:=4
			
			$_at_Values{1}:=String:C10($_l_SizeofArray+1)
			$_at_Values{2}:="Difference"+String:C10(Round:C94((vT1-vT2); 2))
			$_at_Values{3}:=String:C10(vT1)
			$_at_Values{4}:=String:C10(vT2)
			$_at_Formats{2}:="|Accounts"
			$_at_Formats{3}:="|Accounts"
			$_at_Formats{4}:="|Accounts"
			LBI_l_FooterSet:=1
			$_l_FooterColumn:=1
			$_l_FooterColumn:=LB_SetFooters(->GEN_lb_ItemsArea; 1; 4; $_l_FooterColumn; $_at_Values{1}; "Account Balance"; $_at_Values{2}; "Total Accounts"; $_at_Values{3}; "Debit Amount"; $_at_Values{4}; "Credit Amount")
			
	End case 
	GOTO OBJECT:C206(GEN_lb_ItemsArea)
	
	LB_GoToCell(->GEN_lb_ItemsArea; 1; $_l_SizeofArray+1)
	LB_SetScroll(->GEN_lb_ItemsArea; $_l_SizeofArray+1; 1)
End if 
ERR_MethodTrackerReturn("ACCBalance_addSubentity"; $_t_oldMethodName)
