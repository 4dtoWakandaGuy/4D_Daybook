//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_PrintProductsPriceList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   12/11/2010 13:26
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
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; ch1; ch2; DB_l_CurrentDisplayedForm; r1; r2; vNo2; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_SalesPrice)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; vGroup; vRole; vTitle; vTitle1; vTitle2; vTitle3; vTitle4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_PrintProductsPriceList")
CREATE SET:C116([PRODUCTS:9]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1)
	If (Not:C34(SR_ReportOK("ProdPrice")))
		r1:=1
		r2:=0
		vCDateF:=<>DB_d_CurrentDate-30
		vRole:=""
		Open_Any_Window(200; 340)
		DIALOG:C40([PRODUCTS:9]; "dask_Price")
		CLOSE WINDOW:C154
		If (OK=1)
			If (vCDateF=!00-00-00!)
				vTitle4:=""
			Else 
				vTitle4:="• before an item indicates a new product or price change since the last price "+"list"
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
						Print form:C5([PRODUCTS:9]; "Price_Front")
						PAGE BREAK:C6
						QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1="0")
						If (Records in selection:C76([PRODUCT_GROUPS:10])=1)
							Print form:C5([PRODUCTS:9]; "Price_Front2")
							PAGE BREAK:C6
						End if 
						vTitle3:="Product Groups appearing on the Price List"
						QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1#"0")
						ORDER BY:C49([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1; >)
						FORM SET OUTPUT:C54([PRODUCT_GROUPS:10]; "Groups_List")
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
					FORM SET OUTPUT:C54([PRODUCTS:9]; "Price_Ps")
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

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PRD_PrintProductsPriceList"; $_t_oldMethodName)
