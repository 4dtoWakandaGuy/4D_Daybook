If (False:C215)
	//Table Form Method Name: [COMPANIES]dFax_FECover
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>FaxResol; $_l_event; bd12; bd13; bd14; bd15; u1)
	C_TEXT:C284($_t_oldMethodName; vSearch)
	C_TIME:C306(vTime)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dFax_FECover"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dFax_FECover")
		vSearch:="Standard"
		Case of 
			: (<>FaxResol=1)
				bd12:=1
			: (<>FaxResol=2)
				bd13:=1
			: (<>FaxResol=3)
				bd14:=1
			: (<>FaxResol=4)
				bd15:=1
		End case 
		u1:=1
		vDate:=Current date:C33
		vTime:=Current time:C178
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dFax_FECover"; $_t_oldMethodName)
