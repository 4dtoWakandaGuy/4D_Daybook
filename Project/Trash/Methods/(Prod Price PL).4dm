//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod Price PL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_Continue; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vCDateF)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; ch1; ch2; r1; r2; vNo2; vP; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_SalesPrice)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vGroup; vRole; vTitle; vTitle1; vTitle2; vTitle3)
	C_TEXT:C284(vTitle4; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod Price PL")
//Prod Price PL
Start_Process
Products_File
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
READ ONLY:C145([PRODUCTS:9])
While (vP=1)
	DB_t_CurrentFormUsage:="Price"
	Prod_SelP
	If (vP=1)
		If (Records in selection:C76([PRODUCTS:9])>0)
			//DB_t_CurrentFormUsage:="Print"
			//vNo:=Records in selection([PRODUCTS])
			
			//v`No2:=vNo
			//ORDER BY([PRODUCTS];[PRODUCTS]Group Code;>;[PRODUCTS]Product Code;>)
			//Brand Code;>;[PRODUCTS]Product Name;>)
			//Open_Pro_Window ("Price List";0;1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([PRODUCTS];*)
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If (OK=1)
				If (Not:C34(SR_ReportOK("ProdPrice")))
					r1:=1
					r2:=0
					vCDateF:=<>DB_d_CurrentDate-30
					vRole:=""
					Open_Any_Window(200; 340)
					DIALOG:C40([PRODUCTS:9]; "dAsk Price")
					CLOSE WINDOW:C154
					If (OK=1)
						If (vCDateF=!00-00-00!)
							vTitle4:=""
						Else 
							vTitle4:="??? before an item indicates a new product or price change since the last price "+"list"
						End if 
						
						If (ch2=1)
							QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Standard_Price:16#0)
						End if 
						If (vNo2#Records in selection:C76([PRODUCTS:9]))
							ORDER BY:C49([PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Product_Code:1; >)
							//Brand Code;>;[PRODUCTS]Product Name;>)
						End if 
						$_bo_Continue:=True:C214
						If (r1=1)
							$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Price List")
							If ($_l_OK>=0)  //See in PRINT_SetSize about his
								If ($_l_OK=1)
									PRINT SETTINGS:C106
									$_l_OK:=OK
								Else 
									$_l_OK:=1
								End if 
								If ($_l_OK=1)
									vDate:=<>DB_d_CurrentDate
									Letter_Date
									If (ch1=0)
										vTitle:="Price List"
									Else 
										vTitle:="Offer Price List"
									End if 
									Print form:C5([PRODUCTS:9]; "Price Front")
									PAGE BREAK:C6
									QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1="0")
									If (Records in selection:C76([PRODUCT_GROUPS:10])=1)
										Print form:C5([PRODUCTS:9]; "Price Front2")
										PAGE BREAK:C6
									End if 
									vTitle3:="Product Groups appearing on the Price List"
									QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1#"0")
									ORDER BY:C49([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1; >)
									FORM SET OUTPUT:C54([PRODUCT_GROUPS:10]; "Groups List")
									PRINT SELECTION:C60([PRODUCT_GROUPS:10]; *)
									PRT_SetPrinterPaperOptions("Price List")  //NG June 2005
									$_bo_Continue:=True:C214
								Else 
									$_bo_Continue:=False:C215
								End if 
							Else 
								$_bo_Continue:=False:C215
							End if 
						End if 
						
						If (OK=1) & ($_bo_Continue)
							If (r1=1)
								vTitle2:="Retail Price"
								If (ch1=1)
									vTitle1:="Offer Price"
								Else 
									vTitle1:=""
								End if 
								vTitle3:="Price List - "+String:C10(<>DB_d_CurrentDate)
								BREAK LEVEL:C302(1)
								ACCUMULATE:C303([PRODUCTS:9]Sales_Price:9)
								FORM SET OUTPUT:C54([PRODUCTS:9]; "Price PS")
								PRINT SELECTION:C60([PRODUCTS:9]; *)
							Else 
								SET CHANNEL:C77(12; "")
								If (OK=1)
									FIRST RECORD:C50([PRODUCTS:9])
									While (Not:C34(End selection:C36([PRODUCTS:9])))
										vGroup:=[PRODUCTS:9]Group_Code:3
										RELATE ONE:C42([PRODUCTS:9]Group_Code:3)
										SEND PACKET:C103("<*(235.276,2,"+Char:C90(34)+" "+Char:C90(34)+",0,0,"+Char:C90(34)+" "+Char:C90(34)+")\\"+Char:C90(13)+"BUP12*F"+Char:C90(34)+"Garamond"+Char:C90(34)+">")
										SEND PACKET:C103([PRODUCT_GROUPS:10]Group_Name:2+Char:C90(13)+Char:C90(13))
										While ((Not:C34(End selection:C36([PRODUCTS:9]))) & (vGroup=[PRODUCTS:9]Group_Code:3))
											SEND PACKET:C103("<*(235.276,2,"+Char:C90(34)+" "+Char:C90(34)+",0,0,"+Char:C90(34)+" "+Char:C90(34)+")\\"+Char:C90(13)+"DP9*F"+Char:C90(34)+"Garamond"+Char:C90(34)+">")
											$_r_SalesPrice:=([PRODUCTS:9]Sales_Price:9)
											SEND PACKET:C103([PRODUCTS:9]Product_Name:2+Char:C90(9)+String:C10($_r_SalesPrice)+Char:C90(13))
											If ([PRODUCTS:9]Description:6="(")
												SEND PACKET:C103("<*P14,0,29.11,0,0,0,g*(235,2,"+Char:C90(34)+" "+Char:C90(34)+",0,0,"+Char:C90(34)+" "+Char:C90(34)+")\\"+Char:C90(13)+"DP9*F"+Char:C90(34)+"Garamond"+Char:C90(34)+">")
												SEND PACKET:C103([PRODUCTS:9]Description:6+Char:C90(13))
											End if 
											NEXT RECORD:C51([PRODUCTS:9])
										End while 
										SEND PACKET:C103(Char:C90(13))
									End while 
									SET CHANNEL:C77(11)
								End if 
							End if 
						End if 
					End if 
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					
				End if 
			End if 
			//Close_ProWin
			vP:=0
		Else 
			Gen_None("Products"; ->vP)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Prod Price PL"; $_t_oldMethodName)
