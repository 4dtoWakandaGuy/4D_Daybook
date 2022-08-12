If (False:C215)
	//object Name: [USER]ORDERITEMLABELADMIN.oLBLabelAdmin1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2012 06:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LAB_lb_LabelAdmin;0)
	//ARRAY INTEGER(LAB_ai_IncludeLine;0)
	//ARRAY REAL(LAB_ar_QuantityRemaining;0)
	//ARRAY REAL(LAB_ar_QuantityToInclude;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FIeldNumber; $_l_OK; $_l_RowNumber; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_QuantitytoPrintSTR; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ORDERITEMLABELADMIN.oLBLabelAdmin1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FIeldNumber)
		$_l_RowNumber:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->LAB_lb_LabelAdmin; $_t_VariableName)
		Case of 
			: ($_l_ColumnNumber=1)
				LAB_ai_IncludeLine{$_l_RowNumber}:=Abs:C99(LAB_ai_IncludeLine{$_l_RowNumber}-1)
				If (LAB_ai_IncludeLine{$_l_RowNumber}=1)
					If (LAB_ar_QuantityToInclude{$_l_RowNumber}=0)
						LAB_ar_QuantityToInclude{$_l_RowNumber}:=LAB_ar_QuantityRemaining{$_l_RowNumber}
					End if 
				Else 
					LAB_ar_QuantityToInclude{$_l_RowNumber}:=0
				End if 
				
			: ($_l_ColumnNumber=3)
				If (LAB_ar_QuantityToInclude{$_l_RowNumber}>0)
					$_t_QuantitytoPrintSTR:=Request:C163("Qty to Print"; String:C10(LAB_ar_QuantityToInclude{$_l_RowNumber}))
					$_l_OK:=OK
				Else 
					$_t_QuantitytoPrintSTR:=Request:C163("Qty to Print"; String:C10(LAB_ar_QuantityRemaining{$_l_RowNumber}))
					$_l_OK:=OK
				End if 
				If ($_l_OK=1)
					If ((Num:C11($_t_QuantitytoPrintSTR))>LAB_ar_QuantityRemaining{$_l_RowNumber})
						LAB_ar_QuantityToInclude{$_l_RowNumber}:=LAB_ar_QuantityRemaining{$_l_RowNumber}
					Else 
						LAB_ar_QuantityToInclude{$_l_RowNumber}:=Num:C11($_t_QuantitytoPrintSTR)
					End if 
					LAB_ai_IncludeLine{$_l_RowNumber}:=Num:C11(LAB_ar_QuantityToInclude{$_l_RowNumber}>0)
				Else 
				End if 
			: ($_l_ColumnNumber=1)
			: ($_l_ColumnNumber=1)
		End case 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].ORDERITEMLABELADMIN.oLBLabelAdmin1"; $_t_oldMethodName)
