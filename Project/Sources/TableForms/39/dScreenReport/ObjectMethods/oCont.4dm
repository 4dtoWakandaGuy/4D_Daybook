If (False:C215)
	//object Name: [INVOICES]dScreenReport.oCont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_Column; $_l_ColumnNumber; $_l_FieldNumber; $_l_Row; $_l_SIzeOfArray; $_l_TableNumber; LB_l_RowNumber; r1)
	C_TEXT:C284(<>CompCode; $_t_oldMethodName; $_t_VariableName; vTitle; vTitle5; vTitle6; vTitle7; vTitle8)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dScreenReport.oCont"; Form event code:C388)
RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
LISTBOX GET CELL POSITION:C971(GEN_lb_ItemsArea; $_l_Column; $_l_Row)
LB_l_RowNumber:=$_l_Row
Case of 
		//: (ALProEvt=2)  `Double click
	: (Form event code:C388=On Double Clicked:K2:5)
		ARRAY LONGINT:C221($_al_Lines; 0)
		LB_GetSelect(->GEN_lb_ItemsArea; ->$_al_Lines)
		
		$_l_SIzeOfArray:=Size of array:C274($_al_Lines)
		If ($_l_SIzeOfArray>0)
			//$_l_ColumnNumber:=AL_GetColumn (eALContI)
			$_l_ColumnNumber:=LB_GetColumn(->GEN_lb_ItemsArea; $_t_VariableName)
			<>CompCode:=a01Stri1{$_al_Lines{1}}
			<>DB_bo_AutoOut:=False:C215
			<>AutoFind:=True:C214
			If ($_l_ColumnNumber>3)
				Gen_ScrRepSrc($_al_Lines{1})
				
				Case of 
					: (vTitle=Term_SLPLWT("Debtors@"))
						Case of 
							: ($_l_ColumnNumber=5)
								If (r1=1)
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4>=(vDate-DB_GetLedgerADStageOne))
								Else 
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13<=Substring:C12(vTitle5; 4; 99))
								End if 
							: ($_l_ColumnNumber=6)
								If (r1=1)
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<(vDate-DB_GetLedgerADStageOne); *)
									QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4>=(vDate-DB_GetLedgerADStageTwo))
								Else 
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13=vTitle6)
								End if 
							: ($_l_ColumnNumber=7)
								If (r1=1)
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<(vDate-DB_GetLedgerADStageTwo); *)
									QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4>=(vDate-DB_GetLedgerADStageThree))
								Else 
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13=vTitle7)
								End if 
							: ($_l_ColumnNumber=8)
								If (r1=1)
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Invoice_Date:4<(vDate-DB_GetLedgerADStageThree))
								Else 
									QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Period_Code:13>=Substring:C12(vTitle8; 6; 99))
								End if 
						End case 
						If (Records in selection:C76([INVOICES:39])>0)
							COPY NAMED SELECTION:C331([INVOICES:39]; "IA")
							UNLOAD RECORD:C212([INVOICES:39])
							<>DB_bo_AutoOut:=True:C214
							//ZInvoices_Mod
							DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES:39])); <>MENU_l_BarModule; "IA")
							
						Else 
							BEEP:C151
						End if 
					: (vTitle=Term_SLPLWT("Creditors@"))
						Case of 
							: ($_l_ColumnNumber=5)
								If (r1=1)
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Invoice_Date:5>=(vDate-DB_GetLedgerADStageOne))
								Else 
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3<=Substring:C12(vTitle5; 4; 99))
								End if 
							: ($_l_ColumnNumber=6)
								If (r1=1)
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Invoice_Date:5<(vDate-DB_GetLedgerADStageOne); *)
									QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5>=(vDate-DB_GetLedgerADStageTwo))
								Else 
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3=vTitle6)
								End if 
							: ($_l_ColumnNumber=7)
								If (r1=1)
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Invoice_Date:5<(vDate-DB_GetLedgerADStageTwo); *)
									QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5>=(vDate-DB_GetLedgerADStageThree))
								Else 
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3=vTitle7)
								End if 
							: ($_l_ColumnNumber=8)
								If (r1=1)
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Invoice_Date:5<(vDate-DB_GetLedgerADStageThree))
								Else 
									QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3>=Substring:C12(vTitle8; 6; 99))
								End if 
						End case 
						If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
							COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "PA")
							DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])); <>MENU_l_BarModule; "PA")
						Else 
							BEEP:C151
						End if 
				End case 
				
			Else 
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[COMPANIES:2])))
				
				
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ:dScreenReport,GEN_lb_ItemsArea"; $_t_oldMethodName)
