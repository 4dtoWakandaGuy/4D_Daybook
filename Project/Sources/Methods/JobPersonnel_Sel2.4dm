//%attributes = {}
If (False:C215)
	//Project Method Name:      JobPersonnel_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/06/2010 21:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPersonnel_Sel2")
$_t_Search:=$1
vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([JOB PERSONNEL:48])
	Else 
		If ($_t_Search="Job Person: @")
			$_t_Search:=Substring:C12($_t_Search; 13; 32000)
			QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Personnel_Code:18=$_t_Search)
			
		Else 
			$_t_SearchAt:=Sel_AtSign($_t_Search)
			Sel_NoAtAt(->[JOB PERSONNEL:48]; ->[JOB PERSONNEL:48]Job_Code:1; $_t_Search; $_t_SearchAt)
			If (Records in selection:C76([JOB PERSONNEL:48])=0)
				QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Stage_Code:2=$_t_SearchAt)
				If (Records in selection:C76([JOB PERSONNEL:48])=0)
					QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Person:3=$_t_SearchAt)
				End if 
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("JobPersonnel_Sel2"; $_t_oldMethodName)