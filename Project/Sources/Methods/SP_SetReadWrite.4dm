//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SetReadWrite
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SP_SetReadWrite
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array REAL(SP_ar_Probability;0)
	C_BOOLEAN:C305($2; $3)
	C_DATE:C307(SP_D_SalesEnteredDate)
	C_LONGINT:C283($1)
	C_REAL:C285(SP_R_SalesProjectionACTUAL; SP_R_SalesProjectionValue)
	C_TEXT:C284($_t_oldMethodName; SD_t_SalesProjectionGROUP; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact; SP_t_SalesProjectionPerson; SP_t_SalesProjectionTitle; SP_T_SalesProjectionDesc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_SetReadWrite")
//this will set the field on the form
//$1=1 new record(unsaved)
//$1=2=Exisitng record loaded
//normally true if creating a new record-sets the signinficant fields to enterable
//this is set dependant on the record state-if it is false the NO fields are enter
Case of 
	: ($1=1)
		// new record
		If ($3)
			//record is modifiable
			//would be unusual for a  new record to not be
			If ($2)  //set key fields to enterable
				OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionCompany; True:C214)
				OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionContact; True:C214)
				OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionPerson; False:C215)  //always not enterable
				// the above may have a pop-up attached to it though
				OBJECT SET ENTERABLE:C238(SD_t_SalesProjectionGROUP; False:C215)  //always not enterable
				// the above may have a pop-up attached to it though
				OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionTitle; True:C214)
				OBJECT SET ENTERABLE:C238(SP_T_SalesProjectionDesc; False:C215)
				OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionValue; True:C214)
				OBJECT SET ENTERABLE:C238(SP_D_SalesEnteredDate; False:C215)  //never enterable
				OBJECT SET VISIBLE:C603(*; "Text_actual"; False:C215)
				OBJECT SET VISIBLE:C603(SP_R_SalesProjectionValue; False:C215)
				OBJECT SET VISIBLE:C603(SP_R_SalesProjectionACTUAL; False:C215)
				OBJECT SET VISIBLE:C603(*; "Pict_Property"; True:C214)
				OBJECT SET VISIBLE:C603(SP_ar_Probability; True:C214)
				
			Else 
				//set all fields to non enterable
				//would be unusual
			End if 
		Else 
			//locking all fields on a new record!!!
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("SP_SetReadWrite"; $_t_oldMethodName)