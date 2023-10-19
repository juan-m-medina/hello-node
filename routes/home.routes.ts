import { Router} from 'express';
import { hello } from '../controllers/home.controller';

const router = Router();

router.get("/", hello)

export default router;

