//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_al_TimeToDuration
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
	C_DATE:C307($1; $2)
	C_LONGINT:C283($TENDLONG; $TStartLONG)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_al_TimeToDuration")
//this method will calculate a duration based on the time/date(do or done)
//the objective is to display only the Date from(do or done) and a duration
//and of course reverse this to enable duration to time
If (False:C215)  //i am working on this
	Case of 
		: ($2=$1)
			//the start and end date are the same so less than one day
			If ($3#?00:00:00?) & ($4#?00:00:00?)
				//there are times defined
				$TStartLONG:=$3*1
				If ($4#?00:00:00?)
					$TEndLONG:=$4*1
					Case of 
						: (($TEndLONG-(60*60))>$TStartLONG)
							//this is more than one hour
							
						: (($TEndLONG-(60*60))=$TStartLONG)
							//this is one hour
						: (($TEndLONG-(60*60))<$TStartLONG)
							//less than one hour
					End case 
					
				Else 
					//only a start time is defined
					//thats ok-its an event!
					
				End if 
				
			Else 
				//duration is 0=eg this is a to do item
			End if 
		: ($2>$1)  // more than one day
	End case 
	
End if 
ERR_MethodTrackerReturn("SD_al_TimeToDuration"; $_t_oldMethodName)