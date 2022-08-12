If (False:C215)
	//object Name: [COMPANIES]dOpening_Bal.oListOpeningBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY REAL(a01Real1;0)
	//ARRAY REAL(a01Real2;0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	//ARRAY TEXT(a01Stri1;0)
	//ARRAY TEXT(a01Stri2;0)
	//ARRAY TEXT(a01Stri3;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; bd36; LB_l_ColumnNumber; LB_l_InvMode; LB_l_RowNumber)
	C_POINTER:C301($_ptr_ArrayOfArrayNames)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; VTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dOpening_Bal.oListOpeningBalances"; Form event code:C388)
If (LB_l_InvMode=2)
	RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	$_l_Row:=Self:C308->
Else 
	RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	$_l_Row:=Self:C308->
End if 
LB_l_RowNumber:=$_l_Row

LB_l_ColumnNumber:=Find in array:C230($_ptr_ArrayOfArrayNames->; $_t_VariableName)

Case of 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (VTitle="Sales@") | (vTitle="Purch@")
				If (($_l_Row<=Size of array:C274(a01Stri1)))
					Case of 
						: ($_t_VariableName="a01Stri1")
							RemoveLeadTr(Uppers2(a01Stri1{$_l_Row}); ->a01Stri1{$_l_Row})
						: ($_t_VariableName="a01Stri2")
							RemoveLeadTr(Uppers2(a01Stri2{$_l_Row}); ->a01Stri2{$_l_Row})
						: ($_t_VariableName="a01Stri3")
							RemoveLeadTr(Uppercase:C13(a01Stri3{$_l_Row}); ->a01Stri3{$_l_Row})
						: ($_t_VariableName="a01Real1")
							
							vT1:=0
							vT1:=Sum:C1(a01Real1)
							
							//For ($j;1;$s)
							//vT1:=vT1+a01Real1{$j}
							//End for 
							ARRAY TEXT:C222($_at_Columns; 1)
							ARRAY TEXT:C222($_at_Values; 1)
							ARRAY TEXT:C222($_at_Formats; 1)
							$_at_Columns{1}:="Total Customers"
							$_at_Values{1}:=String:C10(VT1)
							$_at_Formats{1}:="|Accounts"
							LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
							
					End case 
				End if 
			: (vTitle="Gene@")
				
				Case of 
					: ($_t_VariableName="a01Stri1")
						RemoveLeadTr(Uppercase:C13(a01Stri1{$_l_Row}); ->a01Stri1{$_l_Row})
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=a01Stri1{$_l_Row})
						If (Records in selection:C76([ACCOUNTS:32])=0)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=a01Stri1{$_l_Row}+"@")
						End if 
						a01Stri1{$_l_Row}:=[ACCOUNTS:32]Account_Code:2
						a01Stri2{$_l_Row}:=[ACCOUNTS:32]Account_Name:3
						
					: ($_t_VariableName="a01Stri2")
						RemoveLeadTr(a01Stri2{$_l_Row}; ->a01Stri2{$_l_Row})
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Name:3=a01Stri2{$_l_Row})
						If (Records in selection:C76([ACCOUNTS:32])=0)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Name:3=a01Stri2{$_l_Row}+"@")
						End if 
						a01Stri2{$_l_Row}:=[ACCOUNTS:32]Account_Name:3
						a01Stri1{$_l_Row}:=[ACCOUNTS:32]Account_Code:2
						
					: ($_t_VariableName="a01Real1") | ($_t_VariableName="a01Real2")
						If ((a01Real1{$_l_Row}#0) & (a01Real2{$_l_Row}#0))
							Gen_Alert("You may only have either a Debit figure or a Credit figure - not both"; "Try again")
							If (bd36=3)
								a01Real1{$_l_Row}:=0
							Else 
								a01Real2{$_l_Row}:=0
							End if 
						End if 
						//$s:=Size of array(a01Real1)
						vT1:=0
						vT2:=0
						vT1:=Sum:C1(a01Real1)
						vT2:=Sum:C1(a01Real2)
						
						//For ($j;1;$s)
						//vT1:=vT1+a01Real1{$j}
						//vT2:=vT2+a01Real2{$j}
						//End for 
						ARRAY TEXT:C222($_at_Columns; 3)
						ARRAY TEXT:C222($_at_Values; 3)
						ARRAY TEXT:C222($_at_Formats; 3)
						$_at_Columns{1}:="Account Balance"
						$_at_Values{1}:="Difference: "+String:C10(Round:C94((vT1-vT2); 2))
						$_at_Formats{1}:="|Accounts"
						$_at_Columns{2}:="Total Debits"
						$_at_Values{2}:=String:C10(vT1)
						$_at_Formats{2}:="|Accounts"
						$_at_Columns{3}:="Total Credits"
						$_at_Values{3}:=String:C10(vT2)
						$_at_Formats{3}:="|Accounts"
						LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
						
						
						
				End case 
				
		End case 
End case 

//***********ends**********************************
ERR_MethodTrackerReturn("OBJ [COMPANIES].dOpening_Bal.oListOpeningBalances"; $_t_oldMethodName)
