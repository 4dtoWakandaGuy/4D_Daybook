//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/06/2010 05:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc; $_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_Sel2")
$_t_Search:=$1
vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([JOB_STAGES:47])
		
	Else 
		If ($_t_Search="Job Stage Code: @")
			//$_l_StringLength:=Length("Job Stage Code:")+1
			$_l_StringLength:=Length:C16("Job Stage Code: ")+1  //corrected bug with string length determination -27/04/08, kmw
			$_t_Search:=Substring:C12($_t_Search; $_l_StringLength; 32000)
			QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=$_t_Search)
			
		Else 
			$_t_SearchAt:=Sel_AtSign($_t_Search)
			Sel_NoAtAt(->[JOB_STAGES:47]; ->[JOB_STAGES:47]Job_Code:1; $_t_Search; $_t_SearchAt)
			If (Records in selection:C76([JOB_STAGES:47])=0)
				QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2=$_t_SearchAt)
				If (Records in selection:C76([JOB_STAGES:47])=0)
					QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Name:3=$_t_SearchAt)
				End if 
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("JobStages_Sel2"; $_t_oldMethodName)