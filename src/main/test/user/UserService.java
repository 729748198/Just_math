package user;

import com.just.math_world.service.WorldFollowService;
import com.just.user.controller.UserController;
import com.just.user.entity.UserInfo;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml"})
public class UserService {
    Logger logger= Logger.getLogger(UserController.class);

    @Autowired
    com.just.user.service.UserService service;

    @Test
    public void SelectByUsername(){
        logger.info("进入测试");
        UserInfo userInfo=service.selectUserInfo("162210702115");
        logger.info(userInfo.getName());
    }
}
