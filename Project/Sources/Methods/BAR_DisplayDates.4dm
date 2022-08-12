//%attributes = {}
If (False:C215)
	//Project Method Name:      BAR_DisplayDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/07/2012 14:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(BAR_al_Days;0)
	C_DATE:C307($_d_Date; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; vDnDateF; vDnDateT; vDoDateF; vDoDateT; vfDateF; vfDateT; vIDateF)
	C_DATE:C307(vIDateT; vrDateF; vrDateT; vRdDateF; vRdDateT; vSDateF; vSDateT)
	C_LONGINT:C283($_l_ItemReference; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_offset; $_l_PopupSelected; $1; $2; $3; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset)
	C_LONGINT:C283(ACC_l_TransDateToOffset; VDnDateFOffset; VDnDateTOffset; VDoDateFOffset; VDoDatetOffset; VfDateFOffset; VfDatetOffset; ViDateFOffset; ViDateTOffset; VRDateFOffset; VRDateTOffset)
	C_LONGINT:C283(VRdDateFOffset; VRdDateTOffset; VsDateFOffset; VsDatetOffset)
	C_POINTER:C301($_ptr_Pointer1; $_ptr_Pointer2)
	C_REAL:C285($_r_AmountRequest)
	C_TEXT:C284($_t_MenuString; $_t_oldMethodName; $_t_PointerVarName; $4; SRCH_T_DateCallBack)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BAR_DisplayDates")
GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)

ARRAY LONGINT:C221(BAR_al_Days; 0)

$_t_MenuString:="(<B "+"Days"
APPEND TO ARRAY:C911(BAR_al_Days; 0)

$_t_MenuString:=$_t_MenuString+";"+"   "+"1 Day"+""
APPEND TO ARRAY:C911(BAR_al_Days; 1)
$_t_MenuString:=$_t_MenuString+";"+"   "+"2 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 2)
$_t_MenuString:=$_t_MenuString+";"+"   "+"3 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 3)
$_t_MenuString:=$_t_MenuString+";"+"   "+"4 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 4)
$_t_MenuString:=$_t_MenuString+";"+"   "+"5 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 5)
$_t_MenuString:=$_t_MenuString+";"+"   "+"6 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 6)
$_t_MenuString:=$_t_MenuString+";"+"   "+"7 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 7)
$_t_MenuString:=$_t_MenuString+";"+"   "+"8 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 8)
$_t_MenuString:=$_t_MenuString+";"+"   "+"9 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 9)
$_t_MenuString:=$_t_MenuString+";"+"   "+"10 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 10)
$_t_MenuString:=$_t_MenuString+";"+"   "+"11 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 11)
$_t_MenuString:=$_t_MenuString+";"+"   "+"12 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 12)
$_t_MenuString:=$_t_MenuString+";"+"   "+"13 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 13)
$_t_MenuString:=$_t_MenuString+";"+"   "+"14 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 14)
$_t_MenuString:=$_t_MenuString+";"+"   "+"15 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 15)
$_t_MenuString:=$_t_MenuString+";"+"   "+"16 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 16)
$_t_MenuString:=$_t_MenuString+";"+"   "+"17 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 17)
$_t_MenuString:=$_t_MenuString+";"+"   "+"18 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 18)
$_t_MenuString:=$_t_MenuString+";"+"   "+"19 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 19)
$_t_MenuString:=$_t_MenuString+";"+"   "+"20 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 20)

$_t_MenuString:=$_t_MenuString+";"+"   "+"21 Day"+""
APPEND TO ARRAY:C911(BAR_al_Days; 21)
$_t_MenuString:=$_t_MenuString+";"+"   "+"22 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 22)
$_t_MenuString:=$_t_MenuString+";"+"   "+"23 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 23)
$_t_MenuString:=$_t_MenuString+";"+"   "+"24 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 24)
$_t_MenuString:=$_t_MenuString+";"+"   "+"25 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 25)
$_t_MenuString:=$_t_MenuString+";"+"   "+"26 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 26)
$_t_MenuString:=$_t_MenuString+";"+"   "+"27 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 27)
$_t_MenuString:=$_t_MenuString+";"+"   "+"28 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 28)
$_t_MenuString:=$_t_MenuString+";"+"   "+"29 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 29)
$_t_MenuString:=$_t_MenuString+";"+"   "+"30 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 30)
$_t_MenuString:=$_t_MenuString+";"+"   "+"31 Days"+""
APPEND TO ARRAY:C911(BAR_al_Days; 31)
$_t_MenuString:=$_t_MenuString+";"+"   "+"Other Days..."+""
APPEND TO ARRAY:C911(BAR_al_Days; 32)


$_t_MenuString:=$_t_MenuString+";"+"   (-"
APPEND TO ARRAY:C911(BAR_al_Days; 0)

$_t_MenuString:=$_t_MenuString+";"+"(<B "+"Months"
APPEND TO ARRAY:C911(BAR_al_Days; 0)

$_t_MenuString:=$_t_MenuString+";"+"   "+"1 Month"+""
APPEND TO ARRAY:C911(BAR_al_Days; -1)
$_t_MenuString:=$_t_MenuString+";"+"   "+"2 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -2)
$_t_MenuString:=$_t_MenuString+";"+"   "+"3 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -3)
$_t_MenuString:=$_t_MenuString+";"+"   "+"4 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -4)
$_t_MenuString:=$_t_MenuString+";"+"   "+"5 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -5)
$_t_MenuString:=$_t_MenuString+";"+"   "+"6 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -6)
$_t_MenuString:=$_t_MenuString+";"+"   "+"7 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -7)
$_t_MenuString:=$_t_MenuString+";"+"   "+"8 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -8)
$_t_MenuString:=$_t_MenuString+";"+"   "+"9 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -9)
$_t_MenuString:=$_t_MenuString+";"+"   "+"10 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -10)
$_t_MenuString:=$_t_MenuString+";"+"   "+"11 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -11)
$_t_MenuString:=$_t_MenuString+";"+"   "+"12 Months"+""
APPEND TO ARRAY:C911(BAR_al_Days; -12)
$_t_MenuString:=$_t_MenuString+";"+"   "+"Other Months.."+""
APPEND TO ARRAY:C911(BAR_al_Days; -13)

$_t_MenuString:=$_t_MenuString+";"+"   (-"
APPEND TO ARRAY:C911(BAR_al_Days; 0)

$_t_MenuString:=$_t_MenuString+";"+"(<B "+"Years"
APPEND TO ARRAY:C911(BAR_al_Days; 0)

$_t_MenuString:=$_t_MenuString+";"+"   "+"1 Year"+""
APPEND TO ARRAY:C911(BAR_al_Days; -100)
$_t_MenuString:=$_t_MenuString+";"+"   "+"2 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -200)
$_t_MenuString:=$_t_MenuString+";"+"   "+"3 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -300)
$_t_MenuString:=$_t_MenuString+";"+"   "+"4 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -400)
$_t_MenuString:=$_t_MenuString+";"+"   "+"5 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -500)
$_t_MenuString:=$_t_MenuString+";"+"   "+"6 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -600)
$_t_MenuString:=$_t_MenuString+";"+"   "+"7 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -700)
$_t_MenuString:=$_t_MenuString+";"+"   "+"8 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -800)
$_t_MenuString:=$_t_MenuString+";"+"   "+"9 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -900)
$_t_MenuString:=$_t_MenuString+";"+"   "+"10 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -1000)
$_t_MenuString:=$_t_MenuString+";"+"   "+"11 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -1100)
$_t_MenuString:=$_t_MenuString+";"+"   "+"12 Years"+""
APPEND TO ARRAY:C911(BAR_al_Days; -1200)
$_t_MenuString:=$_t_MenuString+";"+"   "+"Other Years..."+""
APPEND TO ARRAY:C911(BAR_al_Days; -1500)
$_l_PopupSelected:=Pop up menu:C542($_t_MenuString; 1; $2; $3)
If ($_l_PopupSelected>0)
	If (BAR_al_Days{$_l_PopupSelected}#0)
		$_l_ItemReference:=BAR_al_Days{$_l_PopupSelected}
		$_l_offset:=0
		
		Case of 
			: ($_l_ItemReference>0)
				
				If ($_l_ItemReference=32)
					$_r_AmountRequest:=Gen_RequestAmount("Enter the number of days before the current date"; Is longint:K8:6; 0; "Continue"; "Cancel")
					$_l_offset:=$_r_AmountRequest
					$_d_Date:=(Current date:C33-$_l_offset)
					
					//OBJECT SET VISIBLE(*;"oInvoiceDateT@";True)
				Else 
					//vIDateF:=Current date-$_l_ItemReference
					//ViDateFOffset:=$_l_ItemReference
					$_l_offset:=$_l_ItemReference
					$_d_Date:=(Current date:C33-$_l_ItemReference)
					
				End if 
			: ($_l_ItemReference>-100)
				//months
				If ($_l_ItemReference=-13)
					$_r_AmountRequest:=Gen_RequestAmount("Enter the number of months before the current date"; Is longint:K8:6; 0; "Continue"; "Cancel")
					$_l_offset:=-(Abs:C99($_r_AmountRequest))
					$_d_Date:=Add to date:C393(Current date:C33; 0; -(Abs:C99($_r_AmountRequest)); 0)
					
				Else 
					
					$_l_offset:=$_l_ItemReference
					$_d_Date:=Add to date:C393(Current date:C33; 0; $_l_offset; 0)
					
				End if 
			Else 
				//years
				If ($_l_ItemReference=-1500)
					$_r_AmountRequest:=Gen_RequestAmount("Enter the number of years before the current date"; Is longint:K8:6; 0; "Continue"; "Cancel")
					$_l_offset:=-(Abs:C99($_r_AmountRequest)*100)
					$_d_Date:=Add to date:C393(Current date:C33; -(Abs:C99($_l_offset)/100); 0; 0)
				Else 
					$_l_offset:=$_l_ItemReference
					$_d_Date:=Add to date:C393(Current date:C33; -(Abs:C99($_l_offset)/100); 0; 0)
					
				End if 
		End case 
		If ($_l_offset#0)
			$_t_PointerVarName:=$4+"offset"
			$_ptr_Pointer1:=Get pointer:C304($_t_PointerVarName)
			$_ptr_Pointer2:=Get pointer:C304($4)
			SET PROCESS VARIABLE:C370($1; $_ptr_Pointer1->; $_l_offset)
			SET PROCESS VARIABLE:C370($1; $_ptr_Pointer2->; $_d_Date)
			If (True:C214)
				Case of 
					: ($4="SRCH_d_EntryDateFrom")
						SET PROCESS VARIABLE:C370($1; ACC_l_EntryDateFromOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; SRCH_d_EntryDateFrom; $_d_Date)
					: ($4="VfDateF")
						SET PROCESS VARIABLE:C370($1; VfDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vfDateF; $_d_Date)
					: ($4="SRCH_d_EntryDateTo")
						SET PROCESS VARIABLE:C370($1; ACC_l_EntryDateToOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; SRCH_d_EntryDateTo; $_d_Date)
					: ($4="VfDateF")
						SET PROCESS VARIABLE:C370($1; VfDateTOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vfDateT; $_d_Date)
					: ($4="SRCH_d_TransToDate")
						SET PROCESS VARIABLE:C370($1; ACC_l_TransDateToOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; SRCH_d_TransToDate; $_d_Date)
					: ($4="VtDateF")
						SET PROCESS VARIABLE:C370($1; ACC_l_TransDateToOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; SRCH_d_TransToDate; $_d_Date)
						
					: ($4="ViDateF")
						SET PROCESS VARIABLE:C370($1; ViDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vIDateF; $_d_Date)
						
					: ($4="VrDateF")
						
						SET PROCESS VARIABLE:C370($1; VrDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vrDateF; $_d_Date)
						
					: ($4="VDoDateF")
						SET PROCESS VARIABLE:C370($1; VDoDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vDoDateF; $_d_Date)
					: ($4="VDnDateF")
						SET PROCESS VARIABLE:C370($1; VDoDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vDoDateF; $_d_Date)
						
					: ($4="VsDateF")
						SET PROCESS VARIABLE:C370($1; VsDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vSDateF; $_d_Date)
						
					: ($4="VRdDateF")
						SET PROCESS VARIABLE:C370($1; VRdDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vRdDateF; $_d_Date)
						
					: ($4="VDnDateF")
						SET PROCESS VARIABLE:C370($1; VDnDateFOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vDnDateF; $_d_Date)
					: ($4="ViDateT")
						SET PROCESS VARIABLE:C370($1; ViDateTOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vIDateT; $_d_Date)
					: ($4="VrDateT")
						
						SET PROCESS VARIABLE:C370($1; VrDateTOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vrDateT; $_d_Date)
					: ($4="VDoDateT")
						SET PROCESS VARIABLE:C370($1; VDoDateTOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vDoDateT; $_d_Date)
					: ($4="VsDateT")
						SET PROCESS VARIABLE:C370($1; VsDateTOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vSDateT; $_d_Date)
					: ($4="VRdDateT")
						SET PROCESS VARIABLE:C370($1; VRdDateTOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vRdDateT; $_d_Date)
					: ($4="VDnDateT")
						SET PROCESS VARIABLE:C370($1; VDnDateTOffset; $_l_offset)
						SET PROCESS VARIABLE:C370($1; vDnDateT; $_d_Date)
				End case 
			End if 
			SET PROCESS VARIABLE:C370($1; SRCH_T_DateCallBack; $4)
			POST OUTSIDE CALL:C329($1)  //vIDateF:=Current date-$_l_ItemReference
		End if 
		
		
		
	End if 
	
End if 
ERR_MethodTrackerReturn("BAR_DisplayDates"; $_t_oldMethodName)