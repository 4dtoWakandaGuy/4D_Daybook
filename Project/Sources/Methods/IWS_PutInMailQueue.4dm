//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_PutInMailQueue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY PICTURE(<>IWS_apic_MailQueue;0)
	C_LONGINT:C283($_l_ArrayPosition; $_l_ProcessNumber; $_l_ProcessProperties)
	C_PICTURE:C286($_pic_Picture; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_SMTPHost; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_PutInMailQueue")
//Method: IWS_PutInMailQueue
//  `
//Purpose: Puts a mail item in the queue to send
//
// $1 - picture, mail record as blob as picture (using B2P library)


$_t_SMTPHost:=$1
$_pic_Picture:=$2

While (Semaphore:C143("$MailQueue"))
	IDLE:C311
End while 
$_l_ArrayPosition:=Size of array:C274(<>IWS_apic_MailQueue)+1
ARRAY PICTURE:C279(<>IWS_apic_MailQueue; $_l_ArrayPosition)
<>IWS_apic_MailQueue{$_l_ArrayPosition}:=$_pic_Picture
$_pic_Picture:=$_pic_Picture*0
CLEAR SEMAPHORE:C144("$MailQueue")
$_l_ProcessNumber:=Process number:C372("$MailQueue")
$_l_ProcessProperties:=Process state:C330($_l_ProcessNumber)
If (($_l_ProcessProperties=Does not exist:K13:3) | ($_l_ProcessProperties=Aborted:K13:1))
	$_l_ProcessNumber:=New process:C317("IWS_MailQueue"; 64000; "$MailQueue"; $_t_SMTPHost; *)  // launch process or bring to front
Else 
	If ($_l_ProcessProperties=Paused:K13:6)
		RESUME PROCESS:C320($_l_ProcessNumber)
	End if 
End if 
ERR_MethodTrackerReturn("IWS_PutInMailQueue"; $_t_oldMethodName)