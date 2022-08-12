//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters GP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 23:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_AddMode; $_l_CharacterPosition; $_l_CharPosition2; $_l_EndHighlight; $_l_StartHighlight; vAdd; vP; Write)
	C_REAL:C285($Tot; $TotE)
	C_TEXT:C284(<>KEYS; $_t_CurrentFormUsage; $_t_CurrentOutputform; $_t_FieldDelimiter; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; Enclosures; Products; ProductsD)
	C_TEXT:C284(vSelPrev; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters GP")
//Letters GP
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
$_l_AddMode:=vAdd
vSelPrev:=""
<>Keys:=""
Products_File

While (vP=1)
	Prod_Sel
	If (vP=1)
		If (Records in selection:C76([PRODUCTS:9])>0)
			//vNo:=Records in selection([PRODUCTS])
			//DB_t_CurrentFormUsage:="Select"
			//vAdd:=0
			//CREATE SET([PRODUCTS];"Master")
			//Open_Pro_Window ("Select Products";0;1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//DISPLAY SELECTION([PRODUCTS];*)  `NG may 2004 added table
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			If (OK=1)
				//Userset
				If (Records in selection:C76([PRODUCTS:9])>0)
					Gen_Confirm("Do you want to insert "+String:C10(Records in selection:C76)+" Products_Into the text?"; "Yes"; "No")
					If (OK=1)
						DB_bo_RecordModified:=True:C214
						Products:=""
						ProductsD:=""
						If ((Documents_4DWriteAccessType(False:C215)="W") | (Documents_4DWriteAccessType(False:C215)="SW"))
							$_t_FieldDelimiter:=Char:C90(9)
						Else 
							$_t_FieldDelimiter:=", "
						End if 
						$Tot:=0
						$TotE:=0
						Enclosures:=""
						FIRST RECORD:C50([PRODUCTS:9])
						While (Not:C34(End selection:C36([PRODUCTS:9])))
							Products:=Products+[PRODUCTS:9]Product_Name:2+$_t_FieldDelimiter+String:C10([PRODUCTS:9]Sales_Price:9; "|Accounts")+$_t_FieldDelimiter+String:C10([PRODUCTS:9]Standard_Price:16; "|Accounts")+Char:C90(13)
							ProductsD:=ProductsD+[PRODUCTS:9]Product_Name:2+$_t_FieldDelimiter+String:C10([PRODUCTS:9]Sales_Price:9; "|Accounts")+$_t_FieldDelimiter+String:C10([PRODUCTS:9]Standard_Price:16; "|Accounts")+Char:C90(13)
							If ([PRODUCTS:9]Description:6#"")
								ProductsD:=ProductsD+"   "+[PRODUCTS:9]Description:6+Char:C90(13)+Char:C90(13)
							Else 
								ProductsD:=ProductsD+Char:C90(13)
							End if 
							$Tot:=$Tot+[PRODUCTS:9]Sales_Price:9
							$TotE:=$TotE+[PRODUCTS:9]Standard_Price:16
							If ([PRODUCTS:9]Enclosures:20#"")
								$_l_CharacterPosition:=Position:C15([PRODUCTS:9]Enclosures:20; Enclosures)
								If ($_l_CharacterPosition=0)
									If (Enclosures#"")
										Enclosures:=Enclosures+Char:C90(13)+[PRODUCTS:9]Enclosures:20
									Else 
										Enclosures:=[PRODUCTS:9]Enclosures:20
									End if 
								End if 
							End if 
							NEXT RECORD:C51([PRODUCTS:9])
							
						End while 
						If (Records in selection:C76([PRODUCTS:9])>1)
							Products:=Products+Char:C90(13)+"TOTALS"+$_t_FieldDelimiter+String:C10($Tot; "|Accounts")+$_t_FieldDelimiter+String:C10($TotE; "|Accounts")+Char:C90(13)
							ProductsD:=ProductsD+Char:C90(13)+"TOTALS"+$_t_FieldDelimiter+String:C10($Tot; "|Accounts")+$_t_FieldDelimiter+String:C10($TotE; "|Accounts")+Char:C90(13)
						End if 
						Case of 
							: (Documents_4DWriteAccessType(False:C215)="W@")
								WR GET SELECTION:P12000:2(Write; $_l_StartHighlight; $_l_EndHighlight)
								WR SET SELECTION:P12000:3(Write; 0; 0)
								If (WR Find:P12000:111(Write; "<Products>"; 1; 0; 1)=0) & (WR Find:P12000:111(Write; "<ProductsD>"; 1; 0; 1)=0)
									// If ((WR O Find (Write;"<Products>")=0) & (WR O Find (Write;"<ProductsD>")=0))
									WR SET SELECTION:P12000:3(Write; $_l_StartHighlight; $_l_EndHighlight)
									WR INSERT TEXT:P12000:19(Write; Products)
								Else 
									WR SET SELECTION:P12000:3(Write; 0; 0)
									If (WR Find:P12000:111(Write; "<Products>"; 1; 0; 1)>0)
										//If (WR O Find (Write;"<Products>")>0)
										WR INSERT TEXT:P12000:19(Write; Products)
									End if 
									WR SET SELECTION:P12000:3(Write; 0; 0)
									If (WR Find:P12000:111(Write; "<ProductsD>"; 1; 0; 1)>0)
										// If (WR O Find (Write;"<ProductsD>")>0)
										WR INSERT TEXT:P12000:19(Write; ProductsD)
									End if 
								End if 
								WR SET SELECTION:P12000:3(Write; 0; 0)
								If (WR Find:P12000:111(Write; "<Enclosures>"; 1; 0; 1)>0)
									//  If (WR O Find (Write;"<Enclosures>")>0)
									WR INSERT TEXT:P12000:19(Write; Enclosures)
								End if 
								//        : (◊Write="SW") SuperWrite OUT 24/04/02 pb
								//     $r:=SW Get Select (Write;$_l_StartHighlight;$_l_EndHighlight)
								//     If ($r=0)
								//      $r:=SW Insert Text (Write;Products)
								//     End if
							Else 
								$_l_StartHighlight:=0
								$_l_EndHighlight:=0
								GET HIGHLIGHT:C209([DOCUMENTS:7]Text:3; $_l_StartHighlight; $_l_EndHighlight)
								$_l_CharacterPosition:=Position:C15("<Products>"; [DOCUMENTS:7]Text:3)
								$_l_CharPosition2:=Position:C15("<ProductsD>"; [DOCUMENTS:7]Text:3)
								If (($_l_CharacterPosition=0) & ($_l_CharPosition2=0))
									[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_StartHighlight-1)+Products+Substring:C12([DOCUMENTS:7]Text:3; $_l_EndHighlight; 32000)
								Else 
									If ($_l_CharacterPosition>0)
										$_l_StartHighlight:=$_l_CharacterPosition
										$_l_EndHighlight:=$_l_CharacterPosition+10
										[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_StartHighlight-1)+Products+Substring:C12([DOCUMENTS:7]Text:3; $_l_EndHighlight; 32000)
									End if 
									If ($_l_CharPosition2>0)
										$_l_StartHighlight:=$_l_CharPosition2
										$_l_EndHighlight:=$_l_CharPosition2+11
										[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_StartHighlight-1)+ProductsD+Substring:C12([DOCUMENTS:7]Text:3; $_l_EndHighlight; 32000)
									End if 
								End if 
								$_l_CharacterPosition:=Position:C15("<Enclosures>"; [DOCUMENTS:7]Text:3)
								If ($_l_CharacterPosition>0)
									$_l_CharPosition2:=$_l_CharacterPosition+12
									[DOCUMENTS:7]Text:3:=Substring:C12([DOCUMENTS:7]Text:3; 1; $_l_CharacterPosition-1)+Enclosures+Substring:C12([DOCUMENTS:7]Text:3; $_l_CharPosition2; 32000)
								End if 
						End case 
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
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
DB_bo_RecordModified:=True:C214
vAdd:=$_l_AddMode
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Letters GP"; $_t_oldMethodName)