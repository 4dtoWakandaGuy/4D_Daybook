//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_BoM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 14:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; $Lev; r1; r2; s1; s2; vP)
	C_TEXT:C284($_t_oldMethodName; $Def; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_BoM")
//StockAss_BoM
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Products_File
While (vP=1)
	Prod_Sel
	If (vP=1)
		If (Records in selection:C76([PRODUCTS:9])>0)
			//vNo:=Records in selection([PRODUCTS])
			//DB_t_CurrentFormUsage:="Print"
			//Open_Pro_Window ("Bill of Materials";0;1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([PRODUCTS];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
			
			
			
			If (OK=1)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Assembly_Type:23=True:C214)
				If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
					
					$Def:="10"
					$Lev:=Num:C11(Gen_Request("Maximum Component Levels:"; $Def))
					If (OK=1)
						If (($Lev<1) | ($Lev>10))
							Gen_Alert("The Maximum must be between 1 and 10, and has now been set to 10"; "OK")
							$Lev:=10
						End if 
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Bill of Materials")
						If ($_l_OK>=0)
							CREATE RECORD:C68([STOCK_MOVEMENTS:40])
							[STOCK_MOVEMENTS:40]Movement_Type:6:=[MOVEMENT_TYPES:60]Type_Code:1
							Move_InLPBDef
							Move_InType
							CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=$Lev
							s1:=0
							s2:=0
							r1:=0
							r2:=0
							FIRST RECORD:C50([PRODUCTS:9])
							While (Not:C34(End selection:C36([PRODUCTS:9])))
								Print form:C5([STOCK_MOVEMENT_ITEMS:27]; "StockAss_BoMHdr")
								
								[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[PRODUCTS:9]Product_Code:1
								CUT NAMED SELECTION:C334([PRODUCTS:9]; "$BoM")
								DB_t_CurrentFormUsage:="Display"
								StockAss_Calc
								StockAss_BoM2  //Also used in StockAss_AvailP
								
								USE NAMED SELECTION:C332("$BoM")
								NEXT RECORD:C51([PRODUCTS:9])
							End while 
							PRT_SetPrinterPaperOptions("Bill of Materials")  //NG June 2005
							
							
						End if 
					End if 
				Else 
					Gen_Alert("No Movement Type has been specified as being used for Assemblies"; "Cancel")
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
ERR_MethodTrackerReturn("StockAss_BoM"; $_t_oldMethodName)