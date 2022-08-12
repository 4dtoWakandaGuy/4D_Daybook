//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/06/2010 15:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo2; vP)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_List")
//Products_List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Products_File
While (vP=1)
	Prod_Sel
	If (vP=1)
		If (Records in selection:C76([PRODUCTS:9])>0)
			//vNo:=Records in selection([PRODUCTS])
			//vNo2:=vNo
			//DB_t_CurrentFormUsage:="Print"
			//ORDER BY([PRODUCTS];[PRODUCTS]Group Code;>;[PRODUCTS]Brand Code;>;[PRODUCTS]Model Code;>)
			//Open_Pro_Window ("List Products";0;1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([PRODUCTS];*)
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
			If (OK=1)
				If (vNo2#Records in selection:C76([PRODUCTS:9]))
					
					ORDER BY:C49([PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Brand_Code:4; >; [PRODUCTS:9]Model_Code:5; >)
				End if 
				If (Not:C34(SR_ReportOK("ProdList")))
					Gen_Confirm("Print Supplier details?"; "Yes"; "No")
					If (OK=1)
						DB_t_CurrentFormUsage:="Sup"
					End if 
					
					BREAK LEVEL:C302(2)
					ACCUMULATE:C303([PRODUCTS:9]Sales_Price:9)
					FORM SET OUTPUT:C54([PRODUCTS:9]; "Product_List")
					
					PRINT SELECTION:C60([PRODUCTS:9])
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
ERR_MethodTrackerReturn("Products_List"; $_t_oldMethodName)