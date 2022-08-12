If (False:C215)
	//object Method Name: Object Name:      [INVOICES].dScreenReport.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY DATE(LB_ad_01_1;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_LONGINT:C283($_l_FooterOffset; $_l_Index; $_l_Last; $_l_SizeofArray; $_l_SizeofArray2; eALContI; LB_l_RowNumber)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dScreenReport.Variable5"; Form event code:C388)

If (Gen_Option)
	Gen_Confirm("Are you sure you want to remove all items?"; "Yes"; "No")
	If (OK=1)
		//LBi_ArrDef01
		LBI_AddDef07to99(1)
		LBI_ArrayDefPic(2)
		LBI_arrayDefTime(2)
		
		//AL_UpdateArrays (eALContI;-2)
		If (vTitle="Gene@")
			ARRAY TEXT:C222($_at_Columns; 0)
			ARRAY TEXT:C222($_at_Values; 0)
			ARRAY TEXT:C222($_at_Formats; 0)
			$_l_FooterOffset:=0
			$_l_FooterOffset:=LB_SetFooters(->GEN_lb_ItemsArea; 1; 36; $_l_FooterOffset)  // That will set them all to invisible
			//AL_SetFooters (eALContI;1;4;"";"";"";"")
		Else 
			ARRAY TEXT:C222($_at_Columns; 0)
			ARRAY TEXT:C222($_at_Values; 0)
			ARRAY TEXT:C222($_at_Formats; 0)
			$_l_FooterOffset:=0
			$_l_FooterOffset:=LB_SetFooters(->GEN_lb_ItemsArea; 1; 36; $_l_FooterOffset)  // That will set them all to invisible
			
			//AL_SetFooters (eALContI;1;5;"";"";"";"";"")
		End if 
	End if 
Else 
	ARRAY LONGINT:C221($_al_Lines; 0)
	LB_GetSelect(->eALContI; ->$_al_Lines)
	
	$_l_SizeofArray:=Size of array:C274($_al_Lines)
	If ($_l_SizeofArray=0)
		//NG TODO
		//AL_GetPrevCell (eALContI;bd36;bd37)
		If (LB_l_RowNumber>0)
			ARRAY LONGINT:C221($_al_Lines; 1)
			$_al_Lines{1}:=LB_l_RowNumber
			$_l_SizeofArray:=1
		End if 
	End if 
	If ($_l_SizeofArray>0)
		
		$_l_Last:=$_al_Lines{1}
		
		Case of 
			: ((vTitle="Sales@") | (vTitle="Purch@"))
				For ($_l_index; $_l_SizeofArray; 1; -1)
					DELETE FROM ARRAY:C228(LB_at_01_1; $_al_Lines{$_l_index}; 1)
					DELETE FROM ARRAY:C228(LB_at_01_2; $_al_Lines{$_l_index}; 1)
					DELETE FROM ARRAY:C228(LB_at_01_3; $_al_Lines{$_l_index}; 1)
					DELETE FROM ARRAY:C228(LB_ad_01_1; $_al_Lines{$_l_index}; 1)
					DELETE FROM ARRAY:C228(LB_ar_01_1; $_al_Lines{$_l_index}; 1)
				End for 
				$_l_SizeofArray2:=Size of array:C274(LB_at_01_1)
				vT1:=0
				For ($_l_Index; 1; $_l_SizeofArray2)
					vT1:=vT1+LB_ar_01_1{$_l_Index}
				End for 
				ARRAY TEXT:C222($_at_Columns; 2)
				ARRAY TEXT:C222($_at_Values; 2)
				ARRAY TEXT:C222($_at_Formats; 2)
				$_at_Columns{1}:="Total Customers"
				$_at_Values{1}:=String:C10($_l_SizeofArray)
				$_at_Formats{1}:=""
				$_at_Columns{2}:="Total Outstanding Balance"
				$_at_Values{2}:=String:C10(Vt1)
				$_at_Formats{2}:="|Accounts"
				LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
				
				
			: (vTitle="Gene@")
				For ($_l_index; $_l_SizeofArray; 1; -1)
					DELETE FROM ARRAY:C228(LB_at_01_1; $_al_Lines{$_l_index}; 1)
					DELETE FROM ARRAY:C228(LB_at_01_2; $_al_Lines{$_l_index}; 1)
					DELETE FROM ARRAY:C228(LB_ar_01_1; $_al_Lines{$_l_index}; 1)
					DELETE FROM ARRAY:C228(LB_ar_01_2; $_al_Lines{$_l_index}; 1)
				End for 
				$_l_SizeofArray2:=Size of array:C274(LB_at_01_1)
				vT1:=0
				vT2:=0
				For ($_l_Index; 1; $_l_SizeofArray2)
					vT1:=vT1+LB_ar_01_1{$_l_Index}
					vT2:=vT2+LB_ar_01_2{$_l_Index}
				End for 
				ARRAY TEXT:C222($_at_Columns; 4)
				ARRAY TEXT:C222($_at_Values; 4)
				ARRAY TEXT:C222($_at_Formats; 4)
				$_at_Columns{1}:="Total Accounts"
				$_at_Values{1}:=String:C10($_l_SizeofArray)
				$_at_Formats{1}:=""
				$_at_Columns{2}:="Total Account Balances"
				$_at_Values{2}:="Difference: "+String:C10(Round:C94((vT1-vT2); 2))
				$_at_Formats{2}:="|Accounts"
				$_at_Columns{3}:="Total Debits"
				$_at_Values{3}:=String:C10(vT1)
				$_at_Formats{3}:="|Accounts"
				$_at_Columns{4}:="Total Credits"
				$_at_Values{4}:=String:C10(vT2)
				$_at_Formats{4}:="|Accounts"
				
				LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
				
				
		End case 
		
		
		If ($_l_Last>$_l_SizeofArray2)
			$_l_Last:=$_l_SizeofArray2
		End if 
		//NG TODO
		
		LB_SetScroll(->GEN_lb_ItemsArea; $_l_Last; 1)
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dScreenReport.Variable5"; $_t_oldMethodName)
