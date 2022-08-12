//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_GM
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
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; ch0; ch1; ch2; ch3; vOrd; WIN_l_CurrentWinRef)
	C_REAL:C285(vAmount; vMarginF; vTotal)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_GM")
//Orders_GM
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Orders_File
READ ONLY:C145([ORDERS:24])
READ ONLY:C145([ORDER_ITEMS:25])
While (vOrd=1)
	DB_t_CurrentFormUsage:="GM"
	Orders_SelP
	If (vOrd=1)
		If (Records in selection:C76([ORDERS:24])>0)
			//vNo:=Records in selection([ORDERS])
			//DB_t_CurrentFormUsage:="Print"
			//Open_Pro_Window ("Gross Margin Report";0;1;->[ORDERS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[ORDERS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([ORDERS];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDERS:24])))
			If (OK=1)
				If (Not:C34(SR_ReportOK("OrdGM")))
					Open_Any_Window(210; 340)
					DIALOG:C40([ORDERS:24]; "dAsk_GM")
					CLOSE WINDOW:C154
					$_l_OK:=OK
					OK:=1
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					If ($_l_OK=1)
						FORM SET OUTPUT:C54([ORDERS:24]; "Orders_GM")
						Case of 
							: (ch0=1)
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]Person:5; >; [ORDERS:24]Order_Date:4; >)
							: (ch1=1)
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]Analysis_Code:33; >; [ORDERS:24]Order_Date:4; >)
							: (ch2=1)
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]Currency_Code:32; >; [ORDERS:24]Order_Date:4; >)
							: (ch3=1)
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]Company_Code:1; >; [ORDERS:24]Order_Date:4; >)
						End case 
						BREAK LEVEL:C302(1)
						ACCUMULATE:C303(vAmount; vTotal; vMarginF)
						PRINT SELECTION:C60([ORDERS:24])
						
					End if 
				End if 
			End if 
			//Close_ProWin
			vOrd:=0
		Else 
			Gen_None("Orders"; ->vOrd)
		End if 
	End if 
End while 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Orders_GM"; $_t_oldMethodName)