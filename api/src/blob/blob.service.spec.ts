import { Test, TestingModule } from '@nestjs/testing';
import { BlobService } from './blob.service';
import { ConfigService } from '@nestjs/config';

describe('BlobService', () => {
  let service: BlobService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        BlobService,
        {
          provide: ConfigService,
          useValue: {
            get: jest.fn((key: string) => {
              if (key === 'SUPABASE_URL') return 'http://localhost:54321';
              if (key === 'SUPABASE_SERVICE_ROLE_KEY') return 'test-key';
              return null;
            }),
          },
        },
      ],
    }).compile();

    service = module.get<BlobService>(BlobService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
