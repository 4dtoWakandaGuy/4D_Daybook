If (False:C215)
	//Table Form Method Name: [COMPANIES]dFax_SPCover
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FaxUrgent; DB_bo_NoLoad)
	C_LONGINT:C283(<>FaxCover; bd10; bd12)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dFax_SPCover"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dFax_SPCover")
		If (<>FaxCover>0)
			bd10:=1
		End if 
		If (<>FaxUrgent)
			bd12:=1
		End if 
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dFax_SPCover"; $_t_oldMethodName)
