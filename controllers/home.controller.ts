import { Request, Response } from 'express';
import os from 'os';

export const hello = (req: Request, res: Response) => {
	const pod_name = process.env.HOSTNAME || os.hostname();
	res.send(`Hello Node from ${pod_name}`);
}

