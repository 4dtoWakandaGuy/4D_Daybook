If (False:C215)
	//object Name: [COMPANIES]dProcesses2.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(PRC_al_ProcessNum;0)
	//ARRAY TEXT(PRC_at_ProcessName;0)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $i)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dProcesses2.Variable9"; Form event code:C388)
$i:=1
If ((PRC_at_ProcessName>0) & (Size of array:C274(PRC_al_ProcessNum)>0))
	PROCESS PROPERTIES:C336(PRC_al_ProcessNum{PRC_at_ProcessName}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	vText:=PRC_at_ProcessName{PRC_at_ProcessName}+Char:C90(13)+Char:C90(13)
	vText:=vText+"Process_No: "+String:C10(PRC_al_ProcessNum{PRC_at_ProcessName})+Char:C90(13)
	vText:=vText+"Called by: "+String:C10(PRC_al_ProcessCalledBy{PRC_at_ProcessName})+Char:C90(13)+Char:C90(13)
	vText:=vText+"State: "
	Case of 
		: ($_l_ProcessState=0)
			vText:=vText+"Executing"
		: ($_l_ProcessState=1)
			vText:=vText+"Delayed"
		: ($_l_ProcessState=2)
			vText:=vText+"Awaiting Event"
		: ($_l_ProcessState=3)
			vText:=vText+"Awaiting Input"
		: ($_l_ProcessState=4)
			vText:=vText+"Awaiting Sema"
		: ($_l_ProcessState=5)
			vText:=vText+"Paused"
		: ($_l_ProcessState=6)
			vText:=vText+"Hidden"
		Else 
			vText:=vText+"Aborted"
			$i:=0
	End case 
	vText:=vText+Char:C90(13)+Char:C90(13)+"Time: "+String:C10(Time:C179(Time string:C180($_l_ProcessTime)); 1)+Char:C90(13)
Else 
	vText:="Windows Palette"+Char:C90(13)+Char:C90(13)+"If you highlight a Process then click on this button again"+", you can 'Get Info' on that Process"
End if 

FORM GOTO PAGE:C247(3)
ERR_MethodTrackerReturn("OBJ:dProcesses2,xNext"; $_t_oldMethodName)