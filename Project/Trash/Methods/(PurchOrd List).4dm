//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 15:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283(vPu)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd List")
//PurchOrd List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
$_bo_OK:=PurchOrd_File
If ($_bo_OK)
	While (vPu=1)
		PurchOrd_Sel
		If (vPu=1)
			If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
				//vNo:=Records in selection([PURCHASE ORDERS])
				//DB_t_CurrentFormUsage:="Print"
				//ORDER BY([PURCHASE ORDERS];[PURCHASE ORDERS]Purch Ord Date;>)
				//Open_Pro_Window ("List Purchase Orders";0;1;->[PURCHASE ORDERS];WIN_t_CurrentOutputform)
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[PURCHASE ORDERS];WIN_t_CurrentOutputform)
				//D`ISPLAY SELECTION([PURCHASE ORDERS];*)
				
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])))
				If (OK=1)
					If (Not:C34(SR_ReportOK("POList")))
						Gen_Confirm("Do you want to print the Items?"; "Yes"; "No")
						If (OK=1)
							DB_t_CurrentFormUsage:="Items"
							FORM SET OUTPUT:C54([PURCHASE_ORDERS:57]; "PurchOrd List")
							PRINT SELECTION:C60([PURCHASE_ORDERS:57])
							
						End if 
					End if 
				End if 
				//Close_ProWin
				vPu:=0
			Else 
				Gen_None("Purchase Orders"; ->vPu)
			End if 
		End if 
	End while 
	Process_End
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
End if 
ERR_MethodTrackerReturn("PurchOrd List"; $_t_oldMethodName)