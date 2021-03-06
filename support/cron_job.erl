%% @author Konstantin Nikiforov <helllamer@gmail.com>
%% @copyright 2011 Konstantin Nikiforov
%% @doc Routines for working with #job{} record.

%% Copyright 2011 Konstantin Nikiforov
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(cron_job).

-export([
	new/3,
	get_nextrun/1, set_nextrun/2,
	get_job_pid/1, set_job_pid/2,
	get_task/1,    set_task/2,
	get_counter/1, inc_counter/1,
	get_id/1,
	get_date_created/1
    ]).

-include("../include/cron.hrl").


new(JobId, Task, JobPid) ->
    #job{id=JobId, task=Task, pid=JobPid}.


get_nextrun(#job{nextrun_ts=Timestamp}) ->
    Timestamp.
set_nextrun(Timestamp, Job) ->
    Job#job{nextrun_ts=Timestamp}.


set_job_pid(Pid, Job) ->
    Job#job{pid=Pid}.
get_job_pid(#job{pid=Pid}) ->
    Pid.


get_task(#job{task=Task}) ->
    Task.
set_task(Task, Job) ->
    Job#job{task=Task}.


get_counter(#job{counter=Count}) ->
    Count.
inc_counter(#job{counter=Count} = Job) ->
    Job#job{counter=Count+1}.


get_id(#job{id=JobId}) ->
    JobId.

get_date_created(#job{created=DateCreated}) ->
    DateCreated.
