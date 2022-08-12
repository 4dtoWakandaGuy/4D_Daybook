//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_PrintSource
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     11/11/2010 19:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Sources; 0)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_Date; $_d_Date2; vDateF; vDateT)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vNo1; vNo2; vNo3; vNo4)
	C_REAL:C285(vDue; vInvoiced; vPaid; vTotal)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_PrintSource")
CREATE SET:C116([ORDERS:24]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
DISTINCT VALUES:C339([ORDERS:24]Source:18; $_at_Sources)
QUERY WITH ARRAY:C644([SOURCES:6]Source_Code:1; $_at_Sources)
DBI_MenuSelectRecords(Table name:C256(Table:C252(->[SOURCES:6])); True:C214)

If (Records in selection:C76([ORDERS:24])>=1)
	If (Not:C34(SR_ReportOK("SourcStat")))
		$_d_Date:=<>DB_d_CurrentDate
		Repeat 
			$_d_Date:=$_d_Date-7
		Until (Month of:C24($_d_Date)#Month of:C24(<>DB_d_CurrentDate))
		Repeat 
			$_d_Date:=$_d_Date+1
		Until (Month of:C24($_d_Date)=Month of:C24(<>DB_d_CurrentDate))
		//$DS:="1/"+String(Month of(◊CDate))+"/"+Substring(String(Year of(◊CDate));3;2)
		vDateF:=Gen_RequestDate("Report on Dates from:"; Is date:K8:7; $_d_Date)
		If (OK=1) & (vDateF#!00-00-00!)
			$_d_Date2:=(VDateF+40)-Day of:C23(VDateF+40)
			//$DS:=String((vDateF+40)-Day of(vDateF+40))
			vDateT:=Gen_RequestDate("To Date:"; Is date:K8:7; $_d_Date2)
			If (OK=1) & (vDateT#!00-00-00!)
				FORM SET OUTPUT:C54([SOURCES:6]; "Sources_Stats")
				ORDER BY:C49([SOURCES:6]; [SOURCES:6]Source_Date:3; >)
				BREAK LEVEL:C302(0)
				ACCUMULATE:C303([SOURCES:6]Target_Leads:11; [SOURCES:6]Cost:4; vNo1; vNo2; vNo3; vNo4; vInvoiced; vPaid; vDue; vTotal)
				PRINT SELECTION:C60([SOURCES:6])
				
			End if 
		End if 
	End if 
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_PrintSource"; $_t_oldMethodName)
