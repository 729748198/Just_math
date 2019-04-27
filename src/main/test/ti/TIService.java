package ti;

import com.just.ti.entity.Question;
import com.just.ti.entity.TiBan;
import com.just.ti.service.QuestionService;
import com.just.ti.service.TiBanService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml"})
public class TIService {
    Logger logger= Logger.getLogger(TIService.class);

    @Autowired
    QuestionService questionService;
    @Autowired
    TiBanService tiBanService;

    @Test
    public void testTi(){
        String ban="第一章";
        logger.info("开始测试");
        Question question=questionService.selectTianRandom(ban);
//        List<Question>list=questionService.selectByBan(ban);

        logger.info(question.getTiBan());
    }

    @Test
    public void testBan(){
        String ban="第一章";
        logger.info("开始测试");
        TiBan bt=tiBanService.selectByBan(ban);
        logger.info("查询到数据"+bt.getSumSelect());
        bt.setSumSelect(bt.getSumSelect()+1);
        tiBanService.update(bt);
        logger.info("执行插入"+bt.getSumSelect());
        logger.info(bt.getSumScore());

    }
}
