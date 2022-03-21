package com.alibaba.sreworks.job.master.jobschedule.parallel;

import java.util.List;

import com.alibaba.sreworks.job.master.jobschedule.AbstractJobScheduleConf;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@EqualsAndHashCode(callSuper = true)
@Data
@Slf4j
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ParallelJobScheduleConf extends AbstractJobScheduleConf {

    private List<Long> taskIdList;

}

