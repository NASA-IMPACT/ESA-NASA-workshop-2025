from terratorch.registry import TERRATORCH_BACKBONE_REGISTRY
import torch
from huggingface_hub import hf_hub_download
from torch import nn

pretrained_weights = {
        "tiny_backbone": {
            "hf_hub_id": "community/repo",
            "hf_hub_filename": "model_weights.pt",
        },
    }

class TinyBackbone(nn.Module):
    def __init__(self, in_channels=3, out_channels=[16, 32, 64]):
        super().__init__()
        self.out_channels = out_channels               # ← requirement ②
        # self.channel_list = out_channels
        self.blocks = nn.ModuleList([
            nn.Conv2d(in_channels,  out_channels[0], 3, padding=1),
            nn.Conv2d(out_channels[0], out_channels[1], 3, stride=2, padding=1),
            nn.Conv2d(out_channels[1], out_channels[2], 3, stride=2, padding=1),
        ])

    def forward(self, x):
        feats = []                                     # ← requirement ①
        for blk in self.blocks:
            x = blk(x).relu_()
            feats.append(x)
        return feats


@TERRATORCH_BACKBONE_REGISTRY.register
def tiny_backbone(pretrained: bool = False,
                  ckpt_path: str | None = None,
                  **kwargs):
    # Init model    
    model = TinyBackbone(**kwargs)

    # Weight loading
    if ckpt_path is not None:    
        state_dict = torch.load(ckpt_path, map_location="cpu", weights_only=True)
        model.load_state_dict(state_dict, strict=True)
    elif pretrained:
        # Download weights from Hugging Face
        state_dict_file = hf_hub_download(repo_id=pretrained_weights['tiny_backbone']['hf_hub_id'],
                                          filename=pretrained_weights['tiny_backbone']['hf_hub_filename'])
        state_dict = torch.load(state_dict_file, map_location="cpu", weights_only=True)
        model.load_state_dict(state_dict, strict=True)

    return model