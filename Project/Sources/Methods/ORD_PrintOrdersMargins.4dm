//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_PrintOrdersMargins
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 13:26
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
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; ch0; ch1; ch2; ch3; DB_l_CurrentDisplayedForm; WIN_l_CurrentWinRef)
	C_REAL:C285(vAmount; vMarginF; vTotal)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_PrintOrdersMargins")
CREATE SET:C116([ORDERS:24]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
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

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_PrintOrdersMargins"; $_t_oldMethodName)