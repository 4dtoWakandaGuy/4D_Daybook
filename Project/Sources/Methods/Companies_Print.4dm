//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vCM)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_Print")
//Companies_Print
If (vCM=0)
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	DB_SaveRecord(->[CONTACTS_COMPANIES:145])
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
	DB_SaveRecord(->[COMPANIES:2])
	AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
	COPY NAMED SELECTION:C331([COMPANIES:2]; "Companies")
	RELATE MANY:C262([COMPANIES:2]Company_Code:1)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
	OK:=1
	If ((DB_GetModuleSettingByNUM(14)<2) | ($1="Diary"))
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1)
		
		ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
		FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Print")
	Else 
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[COMPANIES:2]); *)
		QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=[COMPANIES:2]x_ID:63)
		ORDER BY:C49([INFORMATION:55]; [INFORMATION:55]Group:2)
		
		//QUERY([INFORMATION];[INFORMATION]Company Code=[COMPANIES]Company Code)
		FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_PrQ")
	End if 
	DB_t_CurrentFormUsage:="NoSearch"
	PRINT RECORD:C71([COMPANIES:2])
	LOAD RECORD:C52([COMPANIES:2])
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Out")
	USE NAMED SELECTION:C332("Companies")
	CLEAR NAMED SELECTION:C333("Companies")
	Companies_InLPB
Else 
	Gen_Alert("This cannot be used when creating Companies from other files"; "")
End if 
ERR_MethodTrackerReturn("Companies_Print"; $_t_oldMethodName)