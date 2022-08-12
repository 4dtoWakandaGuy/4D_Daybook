//%attributes = {}
If (False:C215)
	//Project Method Name:      PLUGCALL_Telephony
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
	C_LONGINT:C283($_l_Return; $0; $2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PLUGCALL_Telephony")
//in order to facilitate the conversion to 2003 this call has replaced
//the direct call to all telephony functions
// this can then be modified to suit whatever we are using
//the direct pastes would not work  and are not intended to this is just a record of what it said

$_l_Return:=0
Case of 
	: ($1="PlayFile")
		Case of 
			: ($2=1)
				//$_l_Return:=PlayFile (◊TelSession;vTelTask;vTelRes;$_t_Path;0;0;$no;0;0;0;0)
			: ($2=2)
				//$_l_Return:=PlayFile (◊TelSession;vTelTask;vTelRes;$_t_Path;0;0;0;0;0;0;0)
		End case 
	: ($1="PICPLay")
		Case of 
			: ($2=1)
				//$_l_Return:=PictPlay ($Pict)
		End case 
		
	: ($1="RecordStatus")
		//$_l_Return:=RecordStatus($2;$Status;$3;$5»;$4»)
	: ($1="PlayStatus")
		//$_l_Return:=PlayStatus($2;$Status;$3;$5»;$4»)
	: ($1="WaitSpeech")
		//$4->:=WaitSpeech($3->;$4->;$5->;$6->;$7->;$8->)
	: ($1="WaitSilence")
		//to save time as this will probably be rewritten this is a direct paste
		Case of 
			: ($2=1)
				//$_l_Return:=WaitSilence(◊TelSession;vTelTask;vTelRes;$1;$2)
		End case 
		
	: ($1="WaitResource")
		Case of 
			: ($2=1)
				//$_l_Return:=WaitResource (◊TelSession;vTelTask;$1;$2;$3;$res)
		End case 
	: ($1="Dial")
		Case of 
			: ($2=1)
				//$_l_Return:=Dial (◊TelSession;vTelTask;vTelRes;"&,"+$1)
			: ($2=2)
				//$_l_Return:=Dial (◊TelSession;vTelTask;vTelRes;$1)
		End case 
	: ($1="Pic2File")
		Case of 
			: ($2=1)
				//$_l_Return:=Pict2SrvrFile($pict;◊TelSession;$_t_Path)
			: ($2=2)
				//$_l_Return:=SrvrFile2Pict ($_t_Path;◊TelSession;[PICTURES]Picture)
			: ($2=3)
				//$_l_Return:=SrvrFile2Pict($_t_Path;◊TelSession;[PICTURES]Picture)
				
		End case 
	: ($1="RecordFile")
		Case of 
			: ($2=1)
				//$_l_Return:=RecordFile (◊TelSession;vTelTask;vTelRes;$_t_Path;30000;2000;0;1;0;600;1)  `600 = tone duration
			: ($2=2)
				//$_l_Return:=RecordFile(◊TelSession;vTelTask;vTelRes;$_t_Path;$2*1000;$3*1000;0;Num($4);0;600;Num($5))  `600 = tone duration
				
		End case 
	: ($1="Session")
		Case of 
			: ($2=1)
				//$_l_Return:=NewFileTask(◊TelSession;"Delete";$Task)  `Sets up a task & pts a ref in $task
				//$_l_Return:=DeleteHostFile(◊TelSession;$Task;$1)
				//`$_l_Return:=KillTask(◊TelSession;$Task)
			: ($2=2)
				//$_l_Return:=NewTelTask (◊TelSession;Substring($taskName;1;17);vTelTask)  `places this tasks name on the server
				
		End case 
	: ($1="ReleaseResouce")
		Case of 
			: ($2=1)
				//$_l_Return:=ReleaseResource (◊TelSession;vTelTask;vTelRes)
				
				
		End case 
	: ($1="Kill")
		Case of 
			: ($2=1)
				//$_l_Return:=KillTask(◊tmTVProc{$i})  `Kill the task
			: ($2=2)
				//$_l_Return:=KillTask(◊TelSession;vTelTask)  `Kill ourselves on the server
		End case 
	: ($1="CLoseLink")
		Case of 
			: ($2=1)
				//$_l_Return:=CloseLink (◊TelSession;◊TelOwner)
		End case 
	: ($1="WriteDTMF")
		Case of 
			: ($2=1)
				//$_l_Return:=WriteDTMF (◊TelSession;vTelTask;vTelRes;$1)
			: ($2=2)
				//$_l_Return:=WriteDTMF (◊TelSession;vTelTask;vTelRes;"&,")
		End case 
	: ($1="ONHOOK")
		Case of 
			: ($2=1)
				//$_l_Return:=Onhook(◊TelSession;vTelTask;vTelRes)
		End case 
	: ($1="PicRecord")
		$_l_Return:=0
		//$_l_Return:=PictRecord($pict)
		If ($_l_Return=0)
			//$_l_Return:=PictSetDESC($pict;"Sound")
			//[PICTURES]Picture:=$pict
		End if 
	: ($1="Configure")
		//$r:=Configure (◊TelIPActual)
	: ($1="OpenLink")
		Case of 
			: ($2=1)
				//$0:=OpenLink(<>TelSession;<>TelOwner)
				
		End case 
	: ($1="GetDTMF")
		Case of 
			: ($2=1)
				//$r:=GetDTMF(◊TelSession;vTelTask;vTelRes;$1*1000;$2;$3;$d)
		End case 
	: ($1="ClearDTMF")
		Case of 
			: ($2=1)
				//$_l_Return:=ClearDTMF (◊TelSession;vTelTask;vTelRes)
		End case 
		
	: ($1="Answer")
		//$_l_Return:=Answer(◊TelSession;vTelTask;vTelRes;$1)
	: ($1="SCDD")
		Case of 
			: ($2=2)
				//$s:=scdd_State($line1)
			: ($2=3)
				//$s:=scdd_Dial ($1)
		End case 
		
	: ($1="Play")
		Case of 
			: ($2=1)
				//zPLAY($n)
			: ($2=2)
				//PLAY($n;0)
		End case 
		
End case 
ERR_MethodTrackerReturn("PLUGCALL_Telephony"; $_t_oldMethodName)
