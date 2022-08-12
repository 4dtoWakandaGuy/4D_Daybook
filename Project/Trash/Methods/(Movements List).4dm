//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/06/2010 13:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vPu)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements List")
//Movements List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Movements_File
While (vPu=1)
	Movements_Sel
	If (vPu=1)
		If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
			//vNo:=Records in selection([STOCK MOVEMENTS])
			//DB_t_CurrentFormUsage:="Print"
			//ORDER BY([STOCK MOVEMENTS];[STOCK MOVEMENTS]Company From;>)
			//Open_Pro_Window ("Movements List";0;1;->[STOCK MOVEMENTS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[STOCK MOVEMENTS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([STOCK MOVEMENTS];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENTS:40])))
			If (OK=1) & (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
				
				
				If (Not:C34(SR_ReportOK("MovtList")))
					Gen_Confirm("Do you want to print the Items?"; "Yes"; "No")
					If (OK=1)
						DB_t_CurrentFormUsage:="Stock"
					Else 
						REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
						
						//QUERY([STOCK ITEMS];[STOCK ITEMS]Product Code="zzzzz")
					End if 
					FORM SET OUTPUT:C54([STOCK_MOVEMENTS:40]; "Movements List")
					PRINT SELECTION:C60([STOCK_MOVEMENTS:40])
					
				End if 
			End if 
			//Close_ProWin
			vPu:=0
		Else 
			Gen_None("Movements"; ->vPu)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Movements List"; $_t_oldMethodName)
