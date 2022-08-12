If (False:C215)
	//Table Form Method Name: [SERVICE_CALLS]ServiceReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>DataSize; $_l_event)
	C_TEXT:C284($_t_oldMethodName; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle17; vTitle2)
	C_TEXT:C284(vTitle3; vTitle4; vTitle5; vTitle6; vTitle7; vTitle8; vTitle9)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [SERVICE_CALLS].ServiceReport"; Form event code:C388)
//ServiceReport
$_l_event:=Form event code:C388
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDetails; ->[SERVICE_CALLS:20]Call_Date:5; ->[SERVICE_CALLS:20]Call_Time:6; -><>DB_d_CurrentDate; ->vTime; ->[SERVICE_CALLS:20]Call_Code:4; ->[SERVICE_CALLS:20]Charge:8; ->[SERVICE_CALLS:20]Person:11; ->[SERVICE_CALLS:20]Supervisor:13; ->vTel; ->vExtn; ->vDates; ->vSolution; ->[SERVICE_CALLS:20]Problem_Code:14)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vDetails; ->[PROBLEMS:22]Problem_Name:2; ->[SERVICE_CALLS:20]Problem_Description:15; ->[SERVICE_CALLS:20]Solution_Code:16; ->[SOLUTIONS:23]Solution_Name:2; ->[SERVICE_CALLS:20]Solution_Description:17; ->[SERVICE_CALLS:20]Solution_Date:18; ->[SERVICE_CALLS:20]Elapsed_Time:19; ->[SERVICE_CALLS:20]Response_Time:21; ->[SERVICE_CALLS:20]Value:12)
		
		//Set_Fonts ("vDetails+[SERVICE CALLS]Call Date+[SERVICE CALLS]Call Time+◊CDate+vTime";◊DataSize)
		//Set_Fonts ("[SERVICE CALLS]Call Code+[SERVICE CALLS]Charge"+"+[SERVICE CALLS]Person+[SERVICE CALLS]Supervisor";◊DataSize)
		//Set_Fonts ("vTel+vExtn+vDates+vSolution+[SERVICE CALLS]Problem Code";◊DataSize)
		//Set_Fonts ("[PROBLEMS]Problem Name+[SERVICE CALLS]Problem Desc"+"+[SERVICE CALLS]Solution Code";◊DataSize)
		//Set_Fonts ("[SOLUTIONS]Solution Name+[SERVICE CALLS]Solution Desc"+"+[SERVICE CALLS]Solution Date";◊DataSize)
		//Set_Fonts ("[SERVICE CALLS]Elapsed Time+[SERVICE CALLS]Response Time"+"+[SERVICE CALLS]Value";◊DataSize)
		vTitle1:="Company & Contact"
		vTitle2:="Call Code"
		vTitle11:="Charge?"
		vTitle3:="Call Date"
		vTitle4:="Call Time"
		vTitle8:="Person & Supervisor"
		vTitle10:="Telephone"
		vTitle9:="Extn"
		vTitle16:=""
		vTitle17:=""
		vTitle5:="Value"
		vTitle6:="Current Date"
		vTitle7:="Current Time"
		vTitle13:="Solution"
		vTitle12:="Problem"
		vTitle14:="Date"
		vTitle15:="Elapsed & Response"
		Calls_SerRepLP
End case 
ERR_MethodTrackerReturn("FM [SERVICE_CALLS].ServiceReport"; $_t_oldMethodName)
